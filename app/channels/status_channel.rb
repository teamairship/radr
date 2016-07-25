# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class StatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'statuses'
  end

  def unsubscribed
  end

  def ping(params)
    PingJob.perform_later(params.dig('site_id'))
  end
end
