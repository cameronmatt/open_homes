class OpenHomes::Opens
    attr_accessor :date_time

    def self.upcoming
        #OpenHomes::Scraper.new("https://www.stonerealestate.com.au/buy/open-sales/")
        self.scrape_opens
    end

    def self.scrape_opens
        opens = []
        
        opens << self.scrape_stone

        opens
    end

    def self.scrape_stone
        #open_date = []
        doc = Nokogiri::HTML(open("https://www.stonerealestate.com.au/buy/open-sales/"))
        opens = self.new
        opens.date_time = doc.search("p.group-title")
        # dates.map do |date|
        # open_date << date.text.strip
        # end
        # puts open_date
        #binding.pry
        opens
    end

end



        # opens_1 = self.new
        # opens_1.date_time = "Tuesday, 25 May"

        # opens_2 = self.new
        # opens_2.date_time = "Wednesday, 26 May"

        # [opens_1, opens_2]