class Book < ApplicationRecord
  validates :genre, :author, :title, :publisher, :year, presence: true
  has_many :rents, dependent: :nullify

  def actual_rent
    rents.between_from_dates.first
  end

  def self.name_books
    if Book.any?
      Book.all.map { |b| [b.title] }
    else
      []
    end
  end
end
