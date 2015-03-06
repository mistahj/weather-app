
require 'yahoo_weatherman'

puts "What's your zip code?"
zip = gets.chomp

def weather(zip)

client = Weatherman::Client.new
response = client.lookup_by_location(zip).condition['temp']
condition = client.lookup_by_location(zip).condition['text']

temp_f = (1.8 * response + 32).round

puts "#{temp_f} degrees, #{condition}"


end

# weather(zip)

puts weather(zip).forecasts
