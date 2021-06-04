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
end