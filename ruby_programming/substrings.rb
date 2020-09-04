
#inner function that works with the single word
def inner(words,dictionary,result) 
    words.downcase! ; words.delete!(",")
    size = words.length - 1

    #Search the word in the dictionary
    0.upto(size) do |index|
        word = words[index..size]
        while dictionary.include?(word)
            result[word] = (result[word] || 0) + 1
            dictionary.delete_at(dictionary.index(word))
        end
    end

    #search the dictionary word's in the word
    dictionary.select {|word| word.length <= size} .map do |word|
        if words.include?(word)
            result[word] = (result[word] || 0) + 1
        end
    end
end
    
def substrings(words,dictionary) 
    result = {}
    if words.include?(" ")
        words.split(" ").each {|word| inner(word,dictionary,result)}   
    else
        inner(words,dictionary,result)
    end
    return result
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below",dictionary)