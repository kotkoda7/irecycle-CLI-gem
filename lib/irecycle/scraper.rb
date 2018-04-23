#scraper for all metal


class Irecycle::Scraper

	base_url = "https://search.earth911.com/?"

	def self.scrape_by_zip(zipcode)
		html = Nokogiri::HTML(open("#{base_url}what=metal&where=#{zipcode}&list_filter=all&max_distance=25&family_id=&latitude=&longitude=&country=&province=&city=&sponsor="))

		page = html.css('.result-list li')
    	page.each do |center| # will go through the HTML and create new center instances
		      	doc = Irecycle::Center.new
		      	doc.name = center.search(".title a").text.strip
				doc.material = center.search(".result-materials").text.strip
				doc.address1 = center.search(".address1").text.strip
				doc.address2 = center.search(".address2").text.strip
				doc.address3 = center.search(".address3").text.strip
				doc.dist = center.search(".distance").text.strip
				doc.tel = center.search(".phone").text.strip 
		    end
		    Irecycle::Center.all
		  end
	end

		#search_url = BASE_URL + 
		#open(search_url)

		#https://search.earth911.com/?what=metal&where=98226
		#&list_filter=all&max_distance=25&family_id=&latitude=&longitude=&country=&province=&city=&sponsor=

    	#html = Nokogiri::HTML(search_url)

		
		