class OpenHomes::Inspections
    attr_accessor :date, :time, :address, :suburb, :url, :body, :scraper
    
    @@all = []
    
    def initialize(date: nil, time: nil, address: nil, suburb: nil, url: nil, scraper: nil)
        @date = date
        @time = time
        @address = address
        @suburb = suburb
        @url = url
        @scraper = OpenHomes::Scraper.new
        self.class.all << self
    end

    def self.all
        @@all
    end

    def list_inspections
        puts scraper.scrape_inspection.date

        scraper.scrape_inspection.each.with_index(1) do |inspection, index|
            puts "#{index}. #{inspection.time} at #{inspection.address} #{inspection.suburb}"
        end
    end
end