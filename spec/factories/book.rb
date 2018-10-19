require 'faker'

FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { 'imagen.png' }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Time.now.in_time_zone(-5).beginning_of_year }
  end
end
