

class Scraper

	BASE_URL = "https://search.earth911.com/"

	def self.scrape(zip_code, category)
		html = Nokogiri::HTML(open("#{BASE_URL}?what=#{category}&where=#{zip_code}&list_filter=all&max_distance=25&family_id=&latitude=&longitude=&country=&province=&city=&sponsor="))
		slice = html.search('.result-list li')
		slice.each do |doc| 
			center = Irecycle::Center.new
			center.name = doc.search(".title a").text.strip
			center.material = doc.search(".result-materials").text.strip
			center.address1 = doc.css(".address1").text.strip
			center.address2 = doc.css(".address2").text.strip
			center.address3 = doc.css(".address3").text.strip
			center.dist = doc.css(".distance").text.strip
			center.tel = doc.css(".phone").text.strip
		end
		 Irecycle::Center.all
	end
end