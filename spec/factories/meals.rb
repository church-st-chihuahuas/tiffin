FactoryBot.define do
  factory :meal do
    chef
    short_name
    description 'Deliciousness!'
    price { rand(0.0..100.0) }
    active true
  end
end