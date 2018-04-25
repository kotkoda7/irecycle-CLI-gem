

class Irecycle::Scraper

	def self.scrape(zipcode, material)
		base_url = "https://search.earth911.com/?"
		doc = Nokogiri::HTML(open("#{base_url}what=#{material}&where=#{zipcode}&list_filter=all&max_distance=25&family_id=&latitude=&longitude=&country=&province=&city=&sponsor="))

		results = doc.search('.result-list li')
		
		results.each do |ctr| 
			center = Irecycle::Center.new
			center.name = ctr.search(".title a").text.strip
			center.material = ctr.search(".result-materials").text.strip.gsub("Materials accepted:", "")
			center.address1 = ctr.css(".address1").text.strip
			center.address2 = ctr.css(".address2").text.strip
			center.address3 = ctr.css(".address3").text.strip
			center.dist = ctr.css(".distance").text.strip
			center.tel = ctr.css(".phone").text.strip
		end
		 Irecycle::Center.all
	end

	def self.scrape_pagetwo(zipcode, material, page=2)
		base_url = "https://search.earth911.com/?"
		doc = Nokogiri::HTML(open("#{base_url}what=#{material}&where=#{zipcode}&list_filter=all&max_distance=25&family_id=&latitude=&longitude=&country=&province=&city=&sponsor=&list_filter=all&page=#{page}"))

		results = doc.search('.result-list li')
		
		results.each do |ctr| 
			center = Irecycle::Center.new
			center.name = ctr.search(".title a").text.strip
			center.material = ctr.search(".result-materials").text.strip.gsub("Materials accepted:", "")
			center.address1 = ctr.css(".address1").text.strip
			center.address2 = ctr.css(".address2").text.strip
			center.address3 = ctr.css(".address3").text.strip
			center.dist = ctr.css(".distance").text.strip
			center.tel = ctr.css(".phone").text.strip
		end
		 Irecycle::Center.all
	end

	end

