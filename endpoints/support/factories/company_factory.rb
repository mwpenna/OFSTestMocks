require_relative '../env'

FactoryGirl.define do

  factory :company, class: Company do
    name Faker::Company.name + (SecureRandom.random_number(999) + 1000).to_s
    href "http:localhost:4567/company/id/123"
    id "123"
  end

end