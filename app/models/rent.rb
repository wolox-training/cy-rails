class Rent < ApplicationRecord
  validates :init_date, :end_date, presence: true
  validate :valid_init_end_dates#, :overlap_dates
  belongs_to :user, optional: true
  belongs_to :book, optional: true
  after_create :send_mail

  scope :between_from_dates, -> { where('DATE(?) BETWEEN init_date AND end_date', Time.current) }

  scope :overlapping, lambda { |book_id, id, init_date, end_date|
    Rent.where(book_id: book_id).where.not(id: id).where(
      "DATE(:init_date) BETWEEN init_date AND end_date OR
      DATE(:end_date) BETWEEN init_date AND end_date OR
      init_date BETWEEN :init_date AND :end_date OR
      end_date BETWEEN :init_date AND :end_date",
      init_date: init_date, end_date: end_date
    )
  }

  def valid_init_end_dates
    errors.add(:rent, 'Incorrect date, end date less than init date') unless init_date < end_date
  end

  def overlap_dates
    errors.add(:rent, 'Overlapping on dates') unless
      Rent.overlapping(book_id, id, init_date, end_date).empty?
  end

  def send_mail
    RentMailer.new_rent(self).deliver_now
  end
end
