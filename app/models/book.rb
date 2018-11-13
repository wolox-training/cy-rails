class Book < ApplicationRecord
  validates :genre, :author, :title, :publisher, :year, presence: true
  has_many :rents, dependent: :nullify
  scope :name_books, -> { all.map { |b| [b.title, b.id] } }

  def actual_rent
    rents.between_from_dates.first
  end
end
