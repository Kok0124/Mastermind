require_relative 'secretCode'
require_relative 'guessing'

class Game

    attr_reader :gamemode
    attr_reader :code
    attr_reader :guess

    @@roundsCounter = 0
    @@winningCondition = false

    def initialize()
        puts "Please choose game mode : \n 1. AI making the code \n 2. AI guessing the code"

        begin
            gamemode = gets.chomp
            gamemode = Integer(gamemode)
        rescue
            puts "Enter a number"
            retry
        end

        if gamemode == 1
            @gamemode = "AI"
        elsif gamemode == 2
            @gamemode = "human"
        else
            puts "Error"
            abort
        end

        @code = Code.new(@gamemode).code
        @AI = Guessing.new
        @guess = ["", "", "", ""]
    end

    def human_guess()
        guess = []
        puts "Please enter your 4 color seperated by enter: "
        for i in 0..3
            guess.push(gets.chomp)
        end
        @guess = guess
    end

    def play_guess()

        human_guess

        if @guess == @code
            puts "YOU WON !!! (and you needed #{@@roundsCounter+1} rounds)"
            @@winningCondition = true
            return
        end

        puts "\n\n"

        @guess.each_with_index do |color, index|
            if @code.include?(color)
                if @code[index] == @guess[index]
                    print "| Spot On!|"
                else
                    print "| Wrong place |"
                end
            else
                print "| Not In |"
            end
        end

        puts "\n\n"

    end

    def play_code()

        guess=[@AI.getRandomColor, @AI.getRandomColor, @AI.getRandomColor, @AI.getRandomColor]

        guess.each_with_index do |color, index|
            if @code.include?(color)
                if @code[index] == guess[index]
                    @guess[index] = color
                end
            else
                @AI.pushBadColor(color)
            end
        end

        if @guess == @code
            @@winningCondition = true
            puts "The AI won in #{@@roundsCounter+1} rounds"
            return
        end
    end

    def play()
        until @@winningCondition == true || @@roundsCounter == 12
            @gamemode == "AI" ? play_guess : play_code
            @@roundsCounter += 1
        end
        if @@roundsCounter == 12
            puts "Lose. The code was #{@code}"
        end
    end

end

game = Game.new
game.play