class OpenHomes::Scraper
    attr_accessor :base_url, :html, :document
    
    def initialize 
        @base_url = "https://www.highlandproperty.com.au"
        @html = open("#{@base_url}/buying/open-homes/")
        @document = Nokogiri::HTML(html)
    end

    def scrape_inspection_dates
        #binding.pry #document.css(".cell.small-24.medium-8.large-6>a").attribute("href").value
        self.document.css(".grid-x>.cell.small-24").collect do |inspection|
            date_time = inspection.css(".inspection-details>.cell").text.strip
            address = inspection.css(".address-street").text.strip
            suburb = inspection.css(".address-suburb").text.strip
            #price = inspection.css(".price").text.strip
            url = inspection.css(".cell.small-24.medium-8.large-6>a").attribute("href").value

            OpenHomes::Inspections.new(date_time: date_time, address: address, suburb: suburb, url: url)
        end
    end

    def scrape_page_content(url) 
        body = Nokogiri::HTML(open("#{@base_url}#{url}")).css(".listing-description").text.strip
    end

end