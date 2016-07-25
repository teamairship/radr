class SitesController < ApplicationController
  def index
    @sites = Site.all.order(id: :desc)
  end

  def show
    @site = Site.includes(:pings).find(params[:id])
  end
end
