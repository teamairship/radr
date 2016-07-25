module SitesHelper
  def status_class_for(site)
    if site.online?
      'success'
    elsif site.offline?
      'error'
    end
  end
end
