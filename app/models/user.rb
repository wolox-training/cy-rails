class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable

  validates :first_name, :last_name, presence: true
end
