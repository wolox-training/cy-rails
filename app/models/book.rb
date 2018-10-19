class Book < ApplicationRecord
  validates :genre, :author, :title, :publisher, :year, presence: true
  has_many :rents, dependent: :nullify
end
