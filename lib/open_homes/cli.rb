class OpenHomes::CLI

    def call
        menu
    end

    def menu
        puts "Upcoming Inspection times for Stone Real Estate"
        
        @opens = OpenHomes::OpensScraper.upcoming
        @opens.each.with_index(1) do |openday, index|
            puts "#{index}. #{openday.date_time}"
        end
        puts "Enter the number of the date on which you'd like to see open homes, or type 'exit' to exit."
        list_opens
    end

    def list_opens
        input = nil
        while input != "exit"
            input = gets.strip.downcase

            if input.to_i > 0 
                puts "Insepctions for input.value"
                open_date_time = @opens[input.to_i-1]
                puts "#{open_date_time.date_time}"
            elsif input == "list"
                menu
            else
                puts "not sure what you want, type list or exit"
            end
        end
    end

    def goodbye
        puts "See you soon"
    end
end