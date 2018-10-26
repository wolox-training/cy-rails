class User < ApplicationRecord
  # Include default devise modules.
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable
  validates :first_name, :last_name, presence: true
  has_many :rents, dependent: :nullify
  include DeviseTokenAuth::Concerns::User
end
