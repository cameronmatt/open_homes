class OpenHomes::CLI

    def call
        list_opens
        menu
    end

    def list_opens
        puts "Upcoming Inspection times:"
        puts <<-DOC
            1. Tuesday, 25 May
            2. Wednesday, 26 May

        DOC
    end

    def menu
        puts "Enter the number of the date you'd like to see open homes"
        input = gets.strip
        case input
        when "1"
            puts <<-DOC
                    1. Level 2/209/33 Dawes Avenue Castle Hill - Tue May 25 10:00-10:30am
                    2. 1/59 Queenscliff Road Queenscliff - Tue May 25 10:00-10:30am
                    DOC
        when "2"
                puts <<-DOC
                        1. 3/1 Denison Street Manly - Wed May 26 9:00-9:30am
                        2. 59 Ernest Street Balgowlah Heights - Tue May 25 10:00-10:30am
                        DOC
        end
    end
end