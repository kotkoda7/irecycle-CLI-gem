class Irecycle::CLI

	def call
		puts "\nHello! Welcome to the Irecycle gem." 
		puts "\nI'm going to tell you where you can recycle near your location."
		get_zip
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
	     	show_list
	    end
    end


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
