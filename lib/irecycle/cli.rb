
class Irecycle::CLI


	def call
		puts "\nHello! Welcome to the Irecycle gem." 
		puts "\nI'm going to tell you where you can recycle near your location."
		get_zip
	end


	def get_zip
		puts "\nPlease enter your zip code or enter 'exit':"
	    user_zip = gets.chomp.to_s
	    
	    if user_zip == "exit"
	    	final_words

	    elsif 
	    	user_zip.size != 5   # /^\d{5}$/   or    user_zip.match/(^{5}$)/
	      	puts "\nThis was an invalid zipcode."
	      	get_zip
	     else 
	     	get_category(user_zip)
	    end
    end

    def get_category(zipcode)

    	Irecycle::Center.clear

		puts "\nPlease enter the material you want to recycle or 'zip' to get a list for another zipcode:"  

		puts "\nSuggestions:"
		puts "Metal"
		puts "Paper"
		puts "Plastic"
		puts "Electronics"
		puts "Glass"
		puts "Household"
		puts "Garden"
		puts "Organic ﻿Food Waste"
		puts "Batteries"
		puts "Cellphones"
		puts "Paint"
		puts "Hazardous"
		puts "Construction"
		puts "Automotive"
		puts "Or enter the material of your choice:"

		material = gets.chomp.downcase

		if 	material == "zip"
			get_zip

		else 
			list_center_names(zipcode, material)
		end
	end


	def list_center_names(zipcode, material)

		centers = Irecycle::Scraper.scrape(zipcode, material)
			
			centers.each.with_index(1) do |center, i|
      			puts "#{i}. Center Name: #{center.name}"
      	end
      	details
	end

def details

	@num = Irecycle::Center.all.size

	if @num == 0
		puts "No recycling center exists in this category or zipcode. Please try again:"
		get_zip

	else 
		puts "\nWhich center you want to get more information on? (1-#{@num}):"
		choice
   	end
end

def choice    
	choice = gets.chomp.to_i

    if (1..@num).include?(choice)
      	center = Irecycle::Center.all[choice-1]
      	puts "You entered ##{choice}"
		puts "Center Name: #{center.name}"
		puts "Distance to your zipcode: #{center.dist}"
		puts "Center Address: #{center.address1}, #{center.address2}, #{center.address3}"
		puts "Phone: #{center.tel}"
		puts "Some of the other materials accepted at this location: #{center.material}"
		puts "#{center.restrictions}"
		get_another
		
	else
		puts "You entered an invalid number, please try again."
		details
	end
end

	def get_another
		puts "\nDo you want to look at another recycling center? Enter 'yes', 'no'/'exit' or 'new zip':"

		choice2 = gets.chomp.downcase

		if choice2 == "no" || choice2 == "exit"
			final_words
		elsif choice2 == "yes" 
			details
		else
			get_zip
		end
	end


    def final_words
		puts "\nThank you for using the 'Irecycle' CLI GEM. Please remember to first REFUSE, then REUSE! Only RECYCLE if the first 2 options are exhausted.\n"
	end
end