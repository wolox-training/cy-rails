class Rent < ApplicationRecord
  validates :init_date, :end_date, presence: true
  validate :valid_init_end_dates, :overlap_dates
  belongs_to :user, optional: true
  belongs_to :book, optional: true

  scope :between_from_dates, -> { where('DATE(?) BETWEEN init_date AND end_date', Time.current) }

  def valid_init_end_dates
    init_date < end_date
  end

  def overlap_dates
    Rent.where(book_id: id).where.not(book_id: id).where(
      "DATE(:init_date) BETWEEN init_date AND end_date OR
      DATE(:end_date) BETWEEN init_date AND end_date OR
      init_date BETWEEN :init_date AND :end_date OR
      end_date BETWEEN :init_date AND :end_date",
      init_date: init_date, end_date: end_date
    )
  end
end
