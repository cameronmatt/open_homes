class OpenHomes::Inspections
    attr_accessor :date_time, :address, :suburb, :url, :body
    

    @@all = []
    
    def initialize(date_time: nil, address: nil, suburb: nil, url: nil, body: nil)
        @date_time = date_time
        @address = address
        @suburb = suburb
        @url = url
        @body = body
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
        #binding.pry
        puts "========================================"
    end

end