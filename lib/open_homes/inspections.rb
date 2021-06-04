class OpenHomes::Inspections
    attr_accessor :time, :address, :suburb, :property_url, :body
    
    @@all = []
    
    def initialize(time: nil, address: nil, suburb: nil, property_url: nil)
        @time = time
        @address = address
        @suburb = suburb
        @property_url = property_url
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
        puts "#{self.address.upcase}"
        puts "=============================================================="
        puts "#{self.body}"
        #binding.pry
        puts "=============================================================="
    end
end