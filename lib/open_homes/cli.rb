class OpenHomes::CLI
    attr_accessor :scraper, :open_date #, :properties

    def initialize
        @scraper = OpenHomes::Scraper.new
        @open_date = OpenHomes::OpenDate.new
        #@properties = OpenHomes::Properties.new
    end

    def start
        puts "================================================================="  
        puts "Welcome to".upcase 
        puts "╔═╗┬─┐┌─┐┌┐┌┬ ┬┬  ┬  ┌─┐  ╔═╗┌─┐┌─┐┌┐┌  ╦ ╦┌─┐┌┬┐┌─┐┌─┐"   
        puts "║  ├┬┘│ │││││ ││  │  ├─┤  ║ ║├─┘├┤ │││  ╠═╣│ ││││├┤ └─┐"
        puts "╚═╝┴└─└─┘┘└┘└─┘┴─┘┴─┘┴ ┴  ╚═╝┴  └─┘┘└┘  ╩ ╩└─┘┴ ┴└─┘└─┘"                                                             
        puts "================================================================="  
        puts "Below is a list of Open Homes in Cronulla, NSW." 
        puts "================================================================="
        
        open_date.date_menu

        prompt_user_inspections
    end

    def prompt_user_inspections
        puts "Select a number to see inspections for that date."
        puts "Input list to show the list again"
        puts "Input exit to exit"

        input = ""
        
        while input != "exit"
            input = gets.strip

            if input.to_i != 0 && input.to_i <= OpenHomes::OpenDate.all.size
                inspection = OpenHomes::OpenDate.all[input.to_i - 1]
                #inspection should equal the n'th object in the array
                inspection.url = scraper.scrape_inspection(inspection.url) 
                #inspection.url should target the url of above object
                #need to get this url to the scrape_inspection method
                binding.pry
                inspection.print
                prompt_user
            elsif input == "list"
                open_date.date_menu
            elsif input == "exit"
                "See you next time."
                exit
            else 
                "Invalid Input. Please input a number, 'list' or 'exit'."
            end
        end        
    end
end