# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
code = {0 => "SFO", 1 => "NYC"}
def opposite_aiport(start_aiport)
    start_aiport == 1 ? 2 : 1
end
Airport.create!([{code: "SFO"}, {code: "NYC"}])
50.times do 
    start_aiport = rand(2)+1
    finish_airport = opposite_aiport(start_aiport)
    Flight.create!(from_airport: Airport.find(start_aiport) , to_airport: Airport.find(finish_airport),  start:DateTime.now+rand(2000), duration:180.5)
end
