# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
event_params = { search_keyword: "halloween", zipcode: 10016, radius: 4, price: "free", start_date: "this_week" }
testing = EventBriteAdapter.new(event_params)
testing.create_event_objects
