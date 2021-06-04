class OpenHomes::Scraper
    attr_accessor :base_url, :html, :document
    
    def initialize 
        @base_url = "https://www.domain.com.au/sale/cronulla-nsw-2230/inspection-times/?excludeunderoffer=1"
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
        doc = Nokogiri::HTML(html)
        doc.css(".css-1qp9106").collect do |inspection| 
            time = inspection.css("span.css-16q9xmc+span").text.strip
            property_url = inspection.css("div.css-qrqvvg>a").attr("href").value
            address = inspection.css("span.css-iqrvhs").text.strip
            suburb = inspection.css("span.css-iqrvhs>span").text.strip
            
            OpenHomes::Inspections.new(time: time, address: address, suburb: suburb, property_url: property_url)
        end
    end

    def scrape_page_content(property_url) 
        html = URI.parse(property_url).open
        doc = Nokogiri::HTML(html)
        address = doc.css(".css-164r41r").text.strip
        body = doc.css(".css-bq4jj8 .noscript-expander-wrapper.css-aeox7o > div p").text
    end
end

# .css-bq4jj8 .noscript-expander-wrapper.css-aeox7o > div:nth-child(1)