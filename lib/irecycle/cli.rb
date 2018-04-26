
require 'pry'
class Irecycle::CLI


	def call
		puts "\nHello! Welcome to the Irecycle gem." 
		puts "\nI'm going to tell you where you can recycle near your location."
		get_zip
		details
		list_pagetwo(zipcode, material, page=2)
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
	    end
    end

    def get_category(zipcode)

    	#Irecycle::Centers.clear

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

		puts "Please enter a number 1-9 or 'zip' to get a list for another zipcode: "
		
		material = gets.chomp.to_i

		if 	material < 10
			list_center_names(zipcode, material)

		elsif 	material == "zip"
			get_zip
		else 
			puts "You entered an invalid choice. Please try again: "
			get_category(zipcode)
		end
	end


	def list_center_names(zipcode, material)

		@centers = Irecycle::Scraper.scrape(zipcode, material)
			
			@centers.each.with_index(1) do |center, i|
      			puts "#{i}. Center Name: #{center.name}"
		end

	end


def details

	num = Irecycle::Center.all.size
    puts "\nWhich center you want to get more information about? (1- #{num}):"
   
   	choice = gets.chomp.to_i

    if (1..num).include?(choice)
      	center = Irecycle::Center.all[choice-1]
		puts "Center Name: #{center.name}"
		puts "Center Address: #{center.address1}, #{center.address2}, #{center.address3}"
		puts "Phone: #{center.tel}"
		puts "Distance to your zipcode: #{center.dist}"
		puts "Some of the other materials accepted at this location: #{center.material}"
		
		puts "\nDo you want to look at another clinic? (yes/no or 'zip' for get centers for a new zipcode)"
		choice2 = gets.chomp

		if choice2 == "yes" 
			details
		elsif choice2 == "no"
			list_pagetwo(@zipcode, @material, @page=2)
		else
			choice2 == "zip"
			get_zip
		end
	end
end

def list_pagetwo(zipcode, material, page=2)

		puts "Do you want to see another page of recycling centers? (yes/no)"
		answer = gets.chomp
		
		if answer == "yes"
		
			@centers = Irecycle::Scraper.scrape_pagetwo(zipcode, material, page=2)
			@centers.each.with_index(11) do |center, i|
      			puts "#{i}. Center Name: #{center.name}"
   			end
		else
			final_words
		end
	end


    def final_words
		puts "\nThank you for using the 'Irecycle' CLI GEM. Please remember to first REFUSE, then REUSE! Only RECYCLE if the first 2 options are exhausted."
	end
end

	


  	