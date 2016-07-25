# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class SitesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'sites'
  end

  def unsubscribed
  end

  def create(params)
    site = Site.create!(name: params.dig('name'), url: params.dig('url'))
    ActionCable.server.broadcast('sites', site_id: site.id, site: render_site(site))
  end

  def destroy(params)
    Site.find(params.fetch('id')).destroy
  end

  private

  def render_site(site)
    SitesController.render partial: 'sites/site', locals: { site: site }
  end
end
