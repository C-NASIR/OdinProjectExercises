
def stock_picker(stocks)
    min  = 0
    max = 0
  
    #finding the best days when everything is in order
    (stocks.length - 1).downto(1) do |i|
      min = stocks[min] < stocks[i] ? min : i
      max = stocks[max] > stocks[i] ? max : i
    end
  
    #finding best days when the first day is the best to sale]
    if max == 0
      max = 1
      (stocks.length - 1).downto(2) do |i|
        max = stocks[max] > stocks[i] ? max : i
      end
    end
    
    #finding best buy when best day is later than first day
    if min > max
      min = 0
      (max-1).downto(0) do |i|
        min = stocks[min] < stocks[i] ? min : i
      end
    end
  
    return [min,max]
  end
  
  p stock_picker([17,3,6,9,15,8,6,1,10])