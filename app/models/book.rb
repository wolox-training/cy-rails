class Book < ApplicationRecord
  validates :genre, :author, :title, :publisher, :year, presence: true
  has_many :rents, dependent: :nullify

  def actual_rent
    rents.between_from_dates.first
  end
end
