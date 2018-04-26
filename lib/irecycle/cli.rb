


class Irecycle::CLI


	def call
		puts "\nHello! Welcome to the Irecycle gem." 
		puts "\nI'm going to tell you where you can recycle near your location."
		get_zip
		details
		
	end


	def get_zip
		puts "\nPlease enter your zip code:"
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

    	#Irecycle::Centers.clear

		puts "\nPlease enter the material you want to recycle or 'zip' to get a list for another zipcode:"  

		puts "/nSuggestions:"
		puts "Metal"
		puts "Paper"
		puts "Plastic"
		puts "Electronics"
		puts "Glass"
		puts "Household"
		puts "Garden"
		puts "Batteries"
		puts "Paint"
		puts "Hazardous"
		puts "Construction"
		puts "Automotive"
		puts "\nOr enter the material of your choice:"

		material = gets.chomp.downcase

		if 	material == "zip"
			get_zip

		else 
			list_center_names(zipcode, material)
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
    puts "\nWhich center you want to get more information on? (1- #{num}):"
   
   	choice = gets.chomp.to_i
   	puts "You entered number #{choice}"

    if (1..num).include?(choice)
      	center = Irecycle::Center.all[choice-1]
		puts "Center Name: #{center.name}"
		puts "Distance to your zipcode: #{center.dist}"
		puts "Center Address: #{center.address1}, #{center.address2}, #{center.address3}"
		puts "Phone: #{center.tel}"
		puts "Some of the other materials accepted at this location: #{center.material}"
		
		puts "\nDo you want to look at another clinic? (yes/no or 'zip' for get centers for a new zipcode)"
		choice2 = gets.chomp

		if choice2 == "yes" 
			details
		elsif choice2 == "no"
			final_words
		else
			choice2 == "zip"
			get_zip
		end
	end
end



    def final_words
		puts "\nThank you for using the 'Irecycle' CLI GEM. Please remember to first REFUSE, then REUSE! Only RECYCLE if the first 2 options are exhausted."
	end
end

=begin
	def list_pagetwo(zipcode, material, page=2)

		puts "Do you want to see another page of recycling centers? (yes/no)"
		answer = gets.chomp
		
		if answer == "yes"
		
			@centers2 = Irecycle::Scraper.scrape_pagetwo(zipcode, material, page=2)

			@centers2.each.with_index(11) do |center, i|
      			puts "#{i}. Center Name: #{center.name}"
   			end
		else
			final_words
		end
	end
=end

	


  	