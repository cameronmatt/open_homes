class OpenHomes::Inspections
    attr_accessor :date_time, :address, :suburb, :url
    

    @@all = []
    
    def initialize(date_time: nil, address: nil, suburb: nil, url: nil)
        @date_time = date_time
        @address = address
        @suburb = suburb
        @url = url
        self.class.all << self
    end

    def self.all
        @@all
    end

    def print
        puts "========================================"
        puts "#{self.address.upcase} #{self.suburb.upcase}"
        puts "========================================"
        puts self.body
        puts "========================================"
    end

end