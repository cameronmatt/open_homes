class OpenHomes::Scraper
    attr_accessor :base_url, :html, :document
    
    def initialize 
        @base_url = "https://www.domain.com.au/sale/cronulla-nsw-2230/inspection-times/?excludeunderoffer=1&inspectiondate=2021-06-02"
        @html = URI.parse(@base_url).open
        @document = Nokogiri::HTML(html)
    end

    def scrape_inspection_dates
        month = self.document.css("span.css-1rsoq36").text.strip

        self.document.css(".css-11n6jox").collect do |days|
            url = days.attributes["href"].value
            day = days.css("span.css-1sog29b").text.strip
            date = days.css("span.css-1rbbb5w").text.strip

            OpenHomes::OpenDate.new(month: month, url: url, day: day, date: date)
        end
    end

    def scrape_inspection(url)
        html = URI.parse(url).open
        document = Nokogiri::HTML(html)
        #binding.pry
        document.css(".css-1oa1pa6").collect do |inspection| 
            time = inspection.xpath("//span/following-sibling::text()")[2].text.strip 
            address = inspection.css("span.css-iqrvhs").text.strip
            suburb = inspection.css("span.css-iqrvhs>span").text.strip
            property_url = inspection.css(".css-9hd67m>a").attr("href").value
            
            OpenHomes::Inspections.new(time: time, address: address, suburb: suburb, url: url)
        end
    end

    def scrape_page_content(property_url) 
        #binding.pry
        address = Nokogiri::HTML(open(url)).css(".copy").text.strip
        suburb = Nokogiri::HTML(open(url)).css(".copy").text.strip
        body = Nokogiri::HTML(open(url)).css(".copy").text.strip
        #binding.pry
    end

end