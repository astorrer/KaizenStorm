# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :facility do
    name { Faker::Company.name }
  end
  
  factory :invalid_facility do
    name nil
  end
end
