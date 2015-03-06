require 'yahoo_weatherman'

puts "What's your zip code?"
zip = gets.chomp

def get_zip(zip)
client = Weatherman::Client.new
client.lookup_by_location(zip)

end


weather = get_zip(zip)


t = Time.now
today = t.strftime("%w").to_i





weather.forecasts.each do |forecast|


	if forecast["date"].strftime("%w").to_i == today
		which_day = "Today"
	elsif forecast['date'].strftime("%w").to_i == today + 1
		which_day = "Tomorrow"
	else 
		which_day = forecast["date"].strftime("%a")
	end
 
	lows = (1.8 * forecast["low"] + 32).round
	highs = (1.8 * forecast["high"] + 32).round

	puts which_day.to_s + " is going to be " + forecast["text"] +
	 " with a low of " + lows.to_s + " and a high of " +
	  highs.to_s + " degrees Farenheit."
end








