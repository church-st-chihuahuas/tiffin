# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
                {first_name: 'Rubius', last_name: 'Hagrid', email: 'rubius@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1212', street_address: '1001 Massachusetts Ave.', city: 'Cambridge',
                 state: 'MA', zip_code: '02138', role: :chef},
                {first_name: 'Severus', last_name: 'Snape', email: 'severus@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1213', street_address: '1002 Massachusetts Ave.', city: 'Cambridge',
                 state: 'MA', zip_code: '02138', role: :chef},
                {first_name: 'Jim', last_name: 'Bernstein', email: 'jim@excelsior.com', password: 'harry',
                 contact_phone: '212-555-1217', street_address: '19 N Square.', city: 'Boston',
                 state: 'MA', zip_code: '02113', role: :client},
                {first_name: 'Kerry', last_name: 'Cerulean', email: 'kerry@tiffin.com', password: 'harry',
                 contact_phone: '212-555-1218', street_address: '1004 Massachusetts Ave.', city: 'Cambridge',
                 state: 'MA', zip_code: '02138', role: :chef},
                {first_name: 'Albus', last_name: 'Dumbledore', email: 'albus@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1214', street_address: '285 Armistice Blvd', city: 'Pawtucket',
                 state: 'RI', zip_code: '02861', role: :client},
                {first_name: 'Harry', last_name: 'Potter', email: 'harry@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1215', street_address: '1006 Massachusetts Ave.', city: 'Cambridge',
                 state: 'MA', zip_code: '02138', role: :client},
                {first_name: 'Ron', last_name: 'Weasley', email: 'ron@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1216', street_address: '1007 Massachusetts Ave.', city: 'Cambridge',
                 state: 'MA', zip_code: '02138', role: :client},
                {first_name: 'Luna', last_name: 'Lovegood', email: 'luna@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1217', street_address: '319 Broadway', city: 'Arlington',
                 state: 'MA', zip_code: '02474', role: :chef},
                {first_name: 'Neville', last_name: 'Longbottom', email: 'neville@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1218', street_address: '135 Adams St.', city: 'Quincy',
                 state: 'MA', zip_code: '02169', role: :chef},
                {first_name: 'Jack', last_name: 'Abby', email: 'jack@abby.com', password: 'harry',
                 contact_phone: '212-555-1219', street_address: '100 Clinton St.', city: 'Framingham',
                 state: 'MA', zip_code: '01702', role: :chef}
            ])

Certification.create([{name: 'ServSafe', authority: 'ServSafe',
                       url: "https://www.servsafe.com/ServSafe-Manager/Get-Certified"},
                      {name: 'Kosher', authority: 'OK', url: "http://www.ok.org/"},
                      {name: 'Halal', authority: 'USA Halal Chamber of Commerce',
                       url: "http://www.ushalalcertification.com/"}])

DietaryAccommodation.create([{name: 'vegetarian'}, {name: 'gluten free'}, {name: 'vegan'},
                             {name: 'kosher'}, {name: 'halal'}])

Cuisine.create([{name: 'Indian'}, {name: 'Chinese'}, {name: 'Mexican'}, {name: 'Italian'},
                {name: 'American'}, {name: 'Middle Eastern'}])

Chef.create({user_id: User.find_by_email('rubius@hogwarts.edu').id,
              business_name: "Hagrid's Hot Dog Hut",
              business_description: "We make hot dogs out of all the magical beasts you can imagine!"}) do |chef|
  chef.cuisine << Cuisine.find_by_name('Indian')
  chef.cuisine << Cuisine.find_by_name('Middle Eastern')
  chef.dietary_accommodation << DietaryAccommodation.find_by_name('vegetarian')
  chef.dietary_accommodation << DietaryAccommodation.find_by_name('kosher')
  chef.certification << Certification.find_by_authority('OK')
end

Chef.create([{user_id: User.find_by_email('severus@hogwarts.edu').id,
              business_name: "Snape's Slightly Poisonous Potions",
              business_description: "Our potions are only slightly poisonous!"},
             {user_id: User.find_by_email('kerry@tiffin.com').id,
              business_name: "Kerry's Kitchen",
              business_description: "We serve up healthy meals for a variety of tastes and diets.",
              cuisine: [Cuisine.first, Cuisine.second, Cuisine.third]},
             {user_id: User.find_by_email('luna@hogwarts.edu').id,
              business_name: "Luna's Moon Pies",
              business_description: "Loony moon pies filled with wonder.",
              cuisine: [Cuisine.first, Cuisine.second, Cuisine.third]},
             {user_id: User.find_by_email('neville@hogwarts.edu').id,
              business_name: "Neville's Nosherei",
              business_description: "Your home for kosher delights.",
              cuisine: [Cuisine.first, Cuisine.second, Cuisine.third]},
             {user_id: User.find_by_email('jack@abby.com').id,
              business_name: "Jack's Abby Craft Lagers",
              business_description: "Craft lagers for the discerning palate."},
              cuisine: [Cuisine.first, Cuisine.second, Cuisine.third]])

Meal.create([{chef: Chef.first, short_name: 'Chana Masala', description: 'Chickpeas in Masala sauce.'}]) do |meal|
  meal.cuisine << Cuisine.find_by_name('Indian')
  meal.dietary_accommodation << DietaryAccommodation.find_by_name('vegetarian')
end

Meal.create([{chef: Chef.first, short_name: 'Tofu Tacos',
              description: 'Tofu Tacos just like at Pancho Villa in the Mission.'}]) do |meal|
  meal.cuisine << Cuisine.find_by_name('Mexican')
  meal.dietary_accommodation << DietaryAccommodation.find_by_name('vegetarian')
end

Meal.create([{chef: Chef.first, short_name: 'Matzoh Ball Soup',
              description: 'Matzoh ball soup, perfect for Passover.  Mazel Tov!'}]) do |meal|
  meal.cuisine << Cuisine.find_by_name('Middle Eastern')
  meal.dietary_accommodation << DietaryAccommodation.find_by_name('kosher')
end