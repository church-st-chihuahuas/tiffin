FactoryBot.define do
  factory :user do
    first_name 'Anupama'
    password 'hello'
    email 'handle@tiffin.com'
    role 'client'
  end
end




=begin
    first_name
    last_name
    email
    password 'Password1!'
    applicant
    active

    trait :applicant do
      association :role, factory: [:role, :applicant]
    end

    trait :member_of_institution do
      association :role, factory: [:role, :member_of_institution]
    end

    trait :system_administrator do
      association :role, factory: [:role, :system_administrator]
    end

    trait :active do
      is_active true
      deleted_at nil
    end

    trait :inactive do
      is_active false
      deleted_at Time.current
    end
=end
