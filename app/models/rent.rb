class Rent < ApplicationRecord
  validates :init_date, :end_date, presence: true
  belongs_to :user, optional: true
  belongs_to :book, optional: true
end
