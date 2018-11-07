class User < ApplicationRecord
  # Include default devise modules.
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable
  validates :first_name, :last_name, :locale, presence: true
  has_many :rents, dependent: :nullify
  has_many :book_suggestions, dependent: :nullify
  scope :name_users, -> { all.map { |u| [u.email, u.id] } }
  include DeviseTokenAuth::Concerns::User
end
