class RentWorker
  include Sidekiq::Worker

  def perform(id)
    # Do something
    @rent = Rent.find(id).deliver_now
    RentMailer.new_rent(@rent)
  end
end
