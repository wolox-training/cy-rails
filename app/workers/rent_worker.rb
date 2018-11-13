require 'sidekiq-scheduler'
class RentWorker
  include Sidekiq::Worker

  def perform
    expired_rents = Rent.expired_date
    expired_rents.each do |r|
      RentExpirationMailer.expired_rent(r.id).deliver_now
    end
  end
end
