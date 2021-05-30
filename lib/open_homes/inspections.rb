class OpenHomes::Inspections
    attr_accessor :date, :time, :address, :suburb, :url, :body
    

    @@all = []
    
    def initialize(date: nil, time: nil, address: nil, suburb: nil, url: nil, body: nil)
        @date = date
        @time = time
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
        puts "                                         ,--j j-------,       "
        puts "                                        /_.-.___.-.__/ \      "
        puts "                                        | [_],-.[_] |  |      "
        puts "==================================,,,oO8|_o8_|_|_8o_|&888o,,, "
        puts "#{self.address.upcase} #{self.suburb.upcase}"
        puts "=============================================================="
        puts "#{self.body}"
        #binding.pry
        puts "=============================================================="
        prompt_user
    end

end
