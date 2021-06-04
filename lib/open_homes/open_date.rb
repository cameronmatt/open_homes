class OpenHomes::OpenDate
    attr_accessor :month, :url, :day, :date
    
    @@all = []
    
    def initialize(month: nil, url: nil, day: nil, date: nil)
        @month = month
        @url = url
        @day = day
        @date = date 
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.date_menu
        puts "================================================================="
        OpenHomes::Scraper.new.scrape_inspection_dates.each.with_index(1) do |date, index|
           puts "#{index}. #{date.day}, #{date.date} #{date.month}"
        end
        puts "================================================================="
    end

    def list_inspections
        OpenHomes::Scraper.new.scrape_inspection(self.url).each.with_index(1) do |inspection, index|
            puts "#{index}. #{inspection.time} at #{inspection.address} #{inspection.suburb}"
        end
        puts "================================================================="
    end

end 