require 'sidekiq-scheduler'
class RentWorker
  include Sidekiq::Worker

  def perform
    expired_rents = Rent.expired_date.pluck(:id)
    expired_rents.each do |r|
      RentExpirationMailer.expired_rent(r).deliver_now
    end
  end
end
