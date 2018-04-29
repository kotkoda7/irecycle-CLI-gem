

class Irecycle::Scraper

	

	def self.scrape(zipcode, material)
		base_url = "https://search.earth911.com/?"
		doc = Nokogiri::HTML(open("#{base_url}what=#{material}&where=#{zipcode}&list_filter=all&max_distance=50&family_id=&latitude=&longitude=&country=&province=&city=&sponsor="))

		results = doc.search('.result-list li')
		
		results.each do |ctr| 
			center = Irecycle::Center.new
			center.name = ctr.css(".title a").text.strip
			center.material = ctr.css(".result-materials").text.strip.gsub("Materials accepted:", "")
			center.address1 = ctr.css(".address1").text.strip
			center.address2 = ctr.css(".address2").text.strip
			center.address3 = ctr.css(".address3").text.strip
			center.dist = ctr.css(".distance").text.strip
			center.tel = ctr.css(".phone").text.strip
			center.restrictions = ctr.css(".restrictions").text.strip.gsub(/\s+/, " ")

			
		end
		 Irecycle::Center.all
	end
end