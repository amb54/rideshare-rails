# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

def random_fare
  until false
    fare = rand*100
    if fare >= 5 && fare <= 50
      return fare.round(2)
    end
  end
end

#PASSENGER
csv_text = File.read(Rails.root.join('lib', 'seeds', 'passengers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  r = Passenger.new
  r.name = row['name']
  r.phone_num = row['phone_num']
  r.save
end

#DRIVER
csv_text = File.read(Rails.root.join('lib', 'seeds', 'drivers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  d = Driver.new
  d.name = row['name']
  d.vin = row['vin']
  d.save
end

#TRIPS
csv_text = File.read(Rails.root.join('lib', 'seeds', 'trips.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Trip.new
  t.driver_id= row['driver_id'].to_i
  t.passenger_id = row['rider_id'].to_i
  t.date = row['date']
  t.rating = row['rating'].to_i
  t.fare = random_fare
  t.save
end
