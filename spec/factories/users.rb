FactoryGirl.define do
  factory :admin do
    sequence(:email) { |n| "test#{n}@testing.net" }
    password "password"
  end
end
