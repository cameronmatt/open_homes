class OpenHomes::CLI
    attr_accessor :scraper

    def initialize
        @scraper = OpenHomes::Scraper.new
    end

    def start
        puts "Welcome to Stone Real Estate".upcase
        puts "Would you like to see our upcoming inspection?"
        puts "Input Y for yes, or input any character to exit"

        input = gets.strip

        list_inspections if input.downcase == "y"
    end

    def list_inspections
        scraper.scrape_inspection_dates.each.with_index(1) do |inspection, index|
            puts "#{index}. #{inspection.date} #{inspection.time} at #{inspection.address} #{inspection.suburb}"
        end
        prompt_user
    end

    def prompt_user
        puts "Input the number of any property you would like more information on."
        puts "Input list to show the list again"
        puts "Input exit to exit"

        input = ""
        
        while input != "exit"
            input = gets.strip

            if input.to_i != 0 && input.to_i <= OpenHomes::Inspections.all.size
                #binding.pry
                inspection = OpenHomes::Inspections.all[input.to_i - 1]
                inspection.body = scraper.scrape_page_content(inspection.url) 
                inspection.print
                prompt_user
            elsif input == "list"
                list_inspections
            elsif input == "exit"
                "See you next time."
                exit
            else 
                "Invalid Input. Please input a number, 'list' or 'exit'."
            end
        end        
    end
end