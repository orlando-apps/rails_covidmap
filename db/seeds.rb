# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'net/http'

Covidpoint.delete_all

url = 'https://www.trackcorona.live/api/cities'
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)
finalData = data['data']

finalData.each { |loc|
  Covidpoint.create!([
      location: loc['location'],
      country_code: loc['country_code'],
      latitude: loc['latitude'],
      longitude: loc['longitude'],
      confirmed: loc['confirmed'],
      dead: loc['dead']
  ])
}


