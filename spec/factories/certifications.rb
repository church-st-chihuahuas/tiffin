FactoryBot.define do
  factory :certification do
    sequence(:name, 'a') { |n| "certification #{n}" }
    sequence(:authority, 'a') { |n| "by the authority of #{n}" }
    url 'https://zaphod.com'
  end
end