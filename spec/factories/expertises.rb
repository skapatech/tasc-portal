# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expertise do
    subject_id 1
    provider_id 1
    experience 1
    comment "MyString"
  end
end
