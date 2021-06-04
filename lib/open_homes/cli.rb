class OpenHomes::CLI

    def start
        puts "================================================================="  
        puts "Welcome to".upcase 
        puts "╔═╗┬─┐┌─┐┌┐┌┬ ┬┬  ┬  ┌─┐  ╔═╗┌─┐┌─┐┌┐┌  ╦ ╦┌─┐┌┬┐┌─┐┌─┐"   
        puts "║  ├┬┘│ │││││ ││  │  ├─┤  ║ ║├─┘├┤ │││  ╠═╣│ ││││├┤ └─┐"
        puts "╚═╝┴└─└─┘┘└┘└─┘┴─┘┴─┘┴ ┴  ╚═╝┴  └─┘┘└┘  ╩ ╩└─┘┴ ┴└─┘└─┘"                                                             
        puts "================================================================="  
        puts "Below is a list of Open Homes in Cronulla, NSW." 
        puts "================================================================="
        
        OpenHomes::OpenDate.date_menu
        
        prompt_user_inspections
        
    end

    def prompt_user_inspections
        puts "Select a number to see inspections for that date."
        puts "Input list to show the list again"
        puts "Input exit to exit"
        puts "================================================================="
        input = ""
        
        while input != "exit"
            input = gets.strip

            if input.to_i != 0 && input.to_i <= OpenHomes::OpenDate.all.size
                open_date = OpenHomes::OpenDate.all[input.to_i - 1]
                
                open_date.list_inspections
                #binding.pry
                prompt_user_property
                
            elsif input == "list"
                OpenHomes::OpenDate.date_menu
            elsif input == "exit"
                "See you next time."
                exit
            else 
                "Invalid Input. Please input a number, 'list' or 'exit'."
            end
        end        
    end

    def prompt_user_property
        puts "Input the number property of which you would like more information"
        puts "input list to show the list of days again"
        puts "input exit to exit"

        input = ""

        while input != "exit"
            input = gets.strip

            if input.to_i != 0 && input.to_i <= OpenHomes::Inspections.all.size
                property = OpenHomes::Inspections.all[input.to_i - 1]
                property.body = OpenHomes::Scraper.new.scrape_page_content(property.property_url) 
                property.print
                puts "Input 'list' to show the list of days again"
                puts "Input 'exit' to exit"
            elsif input == "list"
                OpenHomes::OpenDate.date_menu
            elsif input == "exit"
                "See you next time."
                exit
            else 
                "Invalid Input. Please input a number, 'list' or 'exit'."
            end
        end        
    end
end