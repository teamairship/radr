class Api::V1::PingController < ApplicationController
  http_basic_authenticate_with name: ENV['API_USERNAME'], password: ENV['API_PASSWORD']

  def new
    PingJob.perform_later
    head :ok
  end
end
