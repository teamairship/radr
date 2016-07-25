class Site < ApplicationRecord
  has_many :pings, dependent: :destroy

  def online?
    return false if latest_status.nil?
    latest_status.between?(200, 299)
  end

  def offline?
    !online?
  end
end
