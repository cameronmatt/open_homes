class OpenHomes::Scraper
    attr_accessor :base_url, :html, :document
    
    def initialize 
        @base_url = "https://www.stonerealestate.com.au/buy/open-sales/"
        @html = open(@base_url)
        @document = Nokogiri::HTML(html)
    end

    def scrape_inspection_dates
        #binding.pry 
        self.document.css(".container").collect do |inspection| 
            date = inspection.css(".date").text.strip 
            time = inspection.css(".time").text.strip 
            address = inspection.css(".address").text.strip
            suburb = inspection.css(".suburb").text.strip
            #url = inspection.css(".price").text.strip
            url = inspection.css(".url>a").attr("href").value
            #binding.pry
            OpenHomes::Inspections.new(date: date, time: time, address: address, suburb: suburb, url: url)
        end
    end

    def scrape_page_content(url) 
        #binding.pry
        body = Nokogiri::HTML(open(url)).css(".copy").text.strip
        #binding.pry
    end

end