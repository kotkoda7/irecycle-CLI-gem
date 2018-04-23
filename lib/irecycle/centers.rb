
#new version. All in one with scraper.


class Irecycle::Centers

	attr_accessor :name, :address1, :address2, :address3, :tel, :dist, :material

	def self.array
		centers = []

		centers << self.scrape(@zipcode, @material)

		centers
	end

	
	def self.scrape(zipcode, material)

		base_url = "https://search.earth911.com/?"
		doc = Nokogiri::HTML(open("#{base_url}what=#{material}&where=#{zipcode}&list_filter=all&max_distance=25&family_id=&latitude=&longitude=&country=&province=&city=&sponsor="))
		
			center = self.new
	      	center.name = doc.css(".title a").text.strip
			center.material = doc.search(".result-materials").text.strip
			center.address1 = doc.search(".address1").text.strip
			center.address2 = doc.search(".address2").text.strip
			center.address3 = doc.search(".address3").text.strip
			center.dist = doc.search(".distance").text.strip
			center.tel = doc.search(".phone").text.strip 
		    
		    center

	end
end


