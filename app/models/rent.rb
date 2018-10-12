class Rent < ApplicationRecord
  validates :init_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true
end
