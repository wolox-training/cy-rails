class User < ApplicationRecord
  # Include default devise modules.
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable
  validates :first_name, :last_name, :locale, presence: true
  has_many :rents, dependent: :nullify
  include DeviseTokenAuth::Concerns::User

  def self.name_users
    if self.any?
      self.all.map { |u| u.email }
    else
      []
    end
  end
end
