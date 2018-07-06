# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
                {first_name: 'Rubius', last_name: 'Hagrid', email: 'rubius@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1212', street_address: 'Hogwarts Cottage 4', city: 'Hogsmeade', state: 'Wales', zip_code: '92501', role: :chef},
                {first_name: 'Severus', last_name: 'Snape', email: 'severus@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1213', street_address: 'Basement 1', city: 'Hogsmeade', state: 'Wales', zip_code: '92503', role: :chef},
                {first_name: 'Albus', last_name: 'Dumbledore', email: 'albus@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1214', street_address: 'Tower Office 2', city: 'Hogsmeade', state: 'Wales', zip_code: '92504', role: :client},
                {first_name: 'Harry', last_name: 'Potter', email: 'harry@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1215', street_address: 'Gryffindor Tower 3', city: 'Hogsmeade', state: 'Wales', zip_code: '92505', role: :client},
                {first_name: 'Ron', last_name: 'Weasley', email: 'ron@hogwarts.edu', password: 'harry',
                 contact_phone: '212-555-1216', street_address: 'Gryffindor Tower 3', city: 'Hogsmeade', state: 'Wales', zip_code: '92506', role: :client}
            ])

Chef.create([{user_id: User.find_by_email('rubius@hogwarts.edu').id,
              business_name: "Hagrid's Hot Dog Hut",
              business_description: "We make hot dogs out of all the magical beasts you can imagine!"},
             {user_id: User.find_by_email('severus@hogwarts.edu').id, business_name: "Snape's Slightly Poisonous Potions",
              business_description: "Our potions are only slightly poisonous!"}])

Certification.create([{name: 'ServSafe', authority: 'ServSafe', url: "https://www.servsafe.com/ServSafe-Manager/Get-Certified"},
                      {name: 'Kosher', authority: 'OK', url: "http://www.ok.org/"},
                      {name: 'Halal', authority: 'USA Halal Chamber of Commerce', url: "http://www.ushalalcertification.com/"}])

DietaryAccommodation.create([{name: 'vegetarian'}, {name: 'gluten free'}, {name: 'vegan'}, {name: 'kosher'}, {name: 'halal'}])

Cuisine.create([{name: 'Indian'}, {name: 'Chinese'}, {name: 'Mexican'}, {name: 'Italian'}, {name: 'American'}])