# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    user_id 1
    provider_id 1
    rating 1
    comments "MyString"
  end
end
