# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :provider do
    first_name "MyString"
    middle_initial "MyString"
    last_name "MyString"
    email "MyString"
    phone "MyString"
    cell "MyString"
    address1 "MyString"
    address2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    rate 1.5
    position "MyString"
    organization "MyString"
    years_experience ""
    resume "MyText"
  end
end
