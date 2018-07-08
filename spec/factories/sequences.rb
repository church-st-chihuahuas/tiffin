FactoryBot.define do
  sequence(:first_name, 'a', aliases: [:last_name, :short_name, :business_name]) { |n| "Name#{n}" }
  sequence(:email) { |n| "client_#{n}@tiffin.com"}
  sequence(:street_address) { |n| "#{n} Mass Ave." }
  sequence(:password)
  CITIES = %w(Cambridge Boston Sommerville Belmont Arlington Watertown Walthan Allston Brighton)
  sequence(:city) { |n| CITIES[(n % (CITIES.length - 1))] }
end