class OpenHomes::CLI

    def call
        menu
        list_opens
    end

    def menu
        puts "Upcoming Inspection times:"
        @opens = OpenHomes::Opens.upcoming
        @opens.each.with_index(1) do |openday, index|
            puts "#{index}. #{openday.date_time}"
        end
    end

    def list_opens
        input = nil
        while input != "exit"
            puts "Enter the number of the date on which you'd like to see open homes, or type 'list' to see dates or type 'exit' to exit."
            input = gets.strip.downcase

            if input.to_i > 0 
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