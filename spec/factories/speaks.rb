# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :speak, :class => 'Speaks' do
    provider_id 1
    language_id 1
  end
end
