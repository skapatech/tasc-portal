# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :education do
    provider_id 1
    degree_id 1
    major "MyString"
  end
end
