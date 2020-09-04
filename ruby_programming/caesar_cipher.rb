
def caesar_cipher(message,skip)
    smallAl = ('a'.."z").to_a
    largeAl = smallAl.join("").upcase.split("")
    length = smallAl.length
    lowercase = false
    symbols = "!? "
    secretMessage = ""


    message.each_char do |char|     
        #checks for symbols  
        if symbols.include?(char)
            secretMessage += symbols[symbols.index(char)]
            next
        end

        #check if they used a non english letter
        if !smallAl.include?(char) && !largeAl.include?(char)
            return "we can't encode your string"
        end

        lowercase = smallAl.include?(char) 
        index = smallAl.index(char) || largeAl.index(char)
        secretIndex = index + skip

        if secretIndex > 25 
            secretMessage += lowercase ? smallAl[secretIndex - length] : largeAl[secretIndex - length]
        else
            secretMessage += lowercase ? smallAl[secretIndex] : largeAl[secretIndex]
        end

    end
    return secretMessage
end

puts caesar_cipher("What a string!", 5) == "Bmfy f xywnsl!"