class Book < ApplicationRecord
  validates :genero, presence: true
  validates :autor, presence: true
  validates :titulo, presence: true
  validates :anio, presence: true
  validates :editor, presence: true
  validates :image, presence: true
end
