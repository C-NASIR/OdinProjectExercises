def bubble_sort(numbers) 
    i = 0; j = numbers.length - 1;
    i.upto(numbers.length-1) do |i|
      j.downto(i) do |j|
        if numbers[j] < numbers[j-1]
          temp = numbers[j]
          numbers[j] = numbers[j-1]
          numbers[j-1] = temp
        end
      end
    end
    return numbers
end

print bubble_sort([1,0,2,3,4,5,6,7])