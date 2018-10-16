class User < ApplicationRecord
  # Include default devise modules.
  include DeviseTokenAuth::Concerns::User
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable
  validates :first_name, :last_name, presence: true
end
