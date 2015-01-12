# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :suggestion do
    reviewed_at "2014-12-16 14:16:44"
    completed_at "2014-12-16 14:16:44"
    verified_at "2014-12-16 14:16:44"
    completed false
    verified false
    meets_theme false
    funded false
    suggestion_type "MyString"
    status "MyString"
    statement "MyString"
    facility_id 1
    department_id 1
    reviewed false
    current_state "MyText"
    ideal_state "MyText"
    benefits "MyText"
    line "MyString"
  end
end
