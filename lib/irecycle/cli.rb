class Irecycle::CLI

	def call
		puts "\nHello! Welcome to the Irecycle gem." 
		puts "\nI'm going to tell you where you can recycle near your location."
		get_zip
		get_category
		show_list(get_zip)
		final_words
	end

	 def get_zip
		puts "\nPlease enter your zip code:"
	    user_zip = gets.chomp.to_s
	    
	    if user_zip.size != 5   # /^\d{5}$/   or    user_zip.match/(^{5}$)/
	      puts "\nInvalid zip code."
	      get_zip
	    elsif user_zip == "exit"
	    	final_words
	     else 
	     	show_list #should also ask for category
	    end
    end


    def get_category
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
		
		@material = gets.chomp.to_i

		if @material < 10
			find_category
		
		elsif material == "exit"
			@final_words

		else 
			find_category
		end
	end

	def find_category

    material = nil

    while material != "exit"
      final_words

      material = gets.strip.downcase

      if material.to_i > 0
    	#doc = Irecycle::Scraper.scrape(zip_code, category)
        doc = @deals[material.to_i-1]
        puts "#{doc.name} - #{doc.price} - #{doc.availability}"
      else
        puts "Not sure what you want."
      end
    end
  end


=begin

		case @material
			when 1
				puts "Here's the list of recycling centers for metal:"
				
			when 2
				puts "Here's the list of recycling centers for paper"
				puts "list centers with page 1 of link repalced with what=paper"
			when 3 
				puts "Here's the list of recycling centers for plastic:"
				puts "list centers with page 1 of link repalced with what=plastic"
			when 4
				puts "Here's the list of recycling centers for electronics:"
				puts "list centers with page 1 of link repalced with what=electronics"
			when 5
				puts "Here's the list of recycling centers for glass:"
				puts "list centers with page 1 of link repalced with what=glass"
			when 6
				puts "Here's the list of recycling centers for household:"
				puts "list centers with page 1 of link repalced with what=household"
			when 7
				puts "Here's the list of recycling centers for batteries:"
				puts "list centers with page 1 of link repalced with what=batteries"
			when 8
				puts "Here's the list of recycling centers for food waste:"
				puts "list centers with page 1 of link repalced with what=food waste"
			when 9
				puts "Here's the list of recycling centers for hazardous material:"
				puts "list centers with page 1 of link repalced with what=hazardous"
			end
		end
=end


    def show_list
	    Irecycle::Center.clear
	    docs = Irecycle::Scraper.scrape

	    docs.each.with_index(1) do |doc, i|
	      puts "#{i}. #{doc.name} - #{doc.material} - #{doc.dist} -
	      #{doc.address1}, #{doc.address2}, #{doc.address3}
	       #{doc.tel}"
	    end
	 end


	def final_words
		puts "\nThank you for using the 'Irecycle' CLI GEM. Please remember to first REFUSE, then REUSE!"
		puts "Only RECYCLE if the first 2 options are exhausted."
	end
	 end
