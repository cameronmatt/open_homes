class OpenHomes::Inspections
    attr_accessor :time, :address, :suburb, :url, :body, :scraper
    
    @@all = []
    
    def initialize(time: nil, address: nil, suburb: nil, url: nil, scraper: nil)
        #@date = date
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


end