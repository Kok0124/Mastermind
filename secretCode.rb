class Code

    COLOURS = ["cyan", "blue", "green", "yellow", "red", "pink", "orange", "purple"]

    attr_reader :code

    def initialize(gamemode="AI")
        code = []
        if gamemode == "AI"
            for i in 0..3
                code.push(COLOURS.sample)
            end
        else
            puts "Please select 4 colours :"
            COLOURS.each_with_index {|color, index| puts "#{index} : #{color}"}

            i = 0
            until i == 4

                begin
                    choice = gets.chomp
                    choice = Integer(choice)
                rescue
                    puts "Enter a number"
                    retry
                end

                if choice.between?(0, 7)
                    code.push(COLOURS[choice])
                    i += 1
                else
                    puts "False input!"
                end

            end # end of until

        end # end of AI or human choise

        @code = code

    end # end of ini

end # end of class