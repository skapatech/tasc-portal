# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :provider do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    phone Faker::PhoneNumber.phone_number
    cell Faker::PhoneNumber.cell_phone
    address1 Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    zip Faker::Address.zip_code
    rate 1.5
    position Faker::Name.title
    organization Faker::Company.name
    resume Faker::Company.bs
  end
end
