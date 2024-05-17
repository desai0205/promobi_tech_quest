FactoryBot.define do
  factory :tutor do
    sequence(:last_name) { |n| "#{n}" }
    sequence(:first_name) { |n| "#{n}" }
    email { "akshay@gmail.com" }
    association :course
  end
end
