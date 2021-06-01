class OpenHomes::Properties
    attr_accessor :address, :suburb, :body
    
    @@all = []
    
    def initialize(address: nil, suburb: nil, body: nil)
        @address = address
        @suburb = suburb
        @body = body
        self.class.all << self
    end

    def self.all
        @@all
    end

    def print_property
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