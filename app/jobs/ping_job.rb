class PingJob < ApplicationJob
  queue_as :default

  rescue_from ActiveJob::DeserializationError do |exception|
    puts 'Site has been deleted. Aborting ping.'
  end

  def perform(site_id = nil)
    if site_id.present?
      site = Site.find(site_id)
      ping(site)
    else
      Site.find_each do |site|
        ping(site)
      end
    end
  end

  def render_site(site)
    SitesController.render partial: 'sites/site', locals: { site: site }
  end

  def ping(site)
    response, description = nil, nil

    begin
      response = Excon.get(site.url)
      description = retrieve_description_from(response)
    rescue => e
      puts "Site #{site.id} failed to ping... #{e.message}"
    ensure
      status, pinged_at = response&.status, Time.now

      site.update_attributes(
        description: description,
        latest_status: status,
        latest_pinged_at: pinged_at
      )
      site.pings.create(status: status, pinged_at: pinged_at)

      ActionCable.server.broadcast('statuses', site_id: site.id, site: render_site(site))
    end
  end

  def retrieve_description_from(response)
    if response.status.between?(200, 299)
      body = response.data.dig(:body)
      page = Nokogiri::HTML(body)

      if page&.at("meta[name='description']").present?
        page&.at("meta[name='description']")
      else
        page&.at("meta[name='Description']")
      end&.send(:[], 'content')
    end
  end
end
