FactoryBot.define do
  factory :chef do
    association :user, factory: %i[user chef]
    business_name
    business_description 'I make food'
  end
end