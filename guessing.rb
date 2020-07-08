class Guessing

    COLOURS = ["cyan", "blue", "green", "yellow", "red", "pink", "orange", "purple"]
    

    def initialize  
        @badColors = []
    end

    def pushBadColor(color)
        @badColors.push(color)
    end


    def getRandomColor()
        if @badColors.length > 0
            return (COLOURS-@badColors).sample
        else
            return COLOURS.sample
        end

    end

    def round(color1, color2, color3, color4)
        
    end
end