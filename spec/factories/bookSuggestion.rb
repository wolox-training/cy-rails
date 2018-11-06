require 'faker'

FactoryBot.define do
  factory :book do
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::Internet.url }
    publisher { Faker::Book.publisher }
    year { Time.now.in_time_zone(-5).beginning_of_year }
  end
end
