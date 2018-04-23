
require 'pry'

class Irecycle::CLI


	def call
		puts "\nHello! Welcome to the Irecycle gem." 
		puts "\nI'm going to tell you where you can recycle near your location."
		get_zip
		final_words
	end


	def get_zip
		puts "\nPlease enter your zip code:"
	    user_zip = gets.chomp.to_s
	    
	    if user_zip == "exit"
	    	final_words

	    elsif 
	    	user_zip.size != 5   # /^\d{5}$/   or    user_zip.match/(^{5}$)/
	      	puts "\nInvalid zip code."
	      	get_zip
	     else 
	     	get_category(user_zip)
	     	#binding.pry
	    end
    end

    def get_category(zipcode)
		puts "\nPlease select the material you want to recycle:"  

		puts "1. Metal"
		puts "2. Paper"
		puts "3. Plastic"
		puts "4. Electronics"
		puts "5. Glass"
		puts "6. Household items"
		puts "7. Batteries"
		puts "8. Food waste"
		puts "9. Hazardous materials"

		puts "Please enter a number between 1 and 9: "
		
		material = gets.chomp.to_i

		if material == "exit"
			final_words
		
		elsif 
			material < 10
			list_centers(@zipcode, @material)

		else 
			list_centers(@zipcode, @material)
		end
	end


	def list_centers(zipcode, material)
		puts "Here's the list of centers you requested:"
		@centers = Irecycle::Centers.array

		@centers.each.with_index(1) do |center, i|
			puts "#{i}. #{center.name}"
			#binding.pry
		end
	end


  	def final_words
		puts "\nThank you for using the 'Irecycle' CLI GEM. Please remember to first REFUSE, then REUSE!"
		puts "Only RECYCLE if the first 2 options are exhausted."
	end

end