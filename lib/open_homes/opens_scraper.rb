class OpenHomes::OpensScraper
    attr_accessor :date_time

    def self.upcoming
        doc = Nokogiri::HTML(open("https://www.stonerealestate.com.au/buy/open-sales/"))
        date_time_elements = doc.css("a.color-default")
        date_time_elements.map do |date|
            opens = self.new 
            opens.date_time = date.text.strip
            opens
        end
        #binding.pry
    end

    def self.scrape_listings
        #open_date = []
        doc = Nokogiri::HTML(open("https://www.stonerealestate.com.au/buy/open-sales/"))
        date_time_elements = doc.css("a.color-default")
        date_time_elements.map do |date|
            opens = self.new 
            opens.date_time = date.text.strip
            opens
        end
        #binding.pry
    end
end
