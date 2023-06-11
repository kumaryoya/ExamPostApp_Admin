FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    trait :admin do
      sequence(:email) { |n| "admin_#{n}@example.com" }
      role { :admin }
    end

    trait :general do
      sequence(:email) { |n| "general_#{n}@example.com" }
      role { :general }
    end
  end
end
