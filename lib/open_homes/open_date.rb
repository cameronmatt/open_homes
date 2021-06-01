class OpenHomes::OpenDate
    attr_accessor :month, :url, :day, :date, :scraper
    
    @@all = []
    
    def initialize(month: nil, url: nil, day: nil, date: nil)
        @month = month
        @url = url
        @day = day
        @date = date 
        @scraper = OpenHomes::Scraper.new
        self.class.all << self
    end

    def self.all
        @@all
    end

    def date_menu
        scraper.scrape_inspection_dates.each.with_index(1) do |date, index|
           puts "#{index}. #{date.day}, #{date.date} #{date.month}"
        end
        puts "================================================================="
    end
end