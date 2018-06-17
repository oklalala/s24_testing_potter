class Cart
  PRICE = 100
  def add(items)
    @ordered_items = items.map{|key, value| value} 
  end

  def calculate
    total = 0
    ＠ordered_items = @ordered_items.delete_if{ |i| i == 0}
      while @ordered_items.size > 0
        if @ordered_items.size == 3
          total += 3*PRICE*0.9
        elsif @ordered_items.size == 2
          total += 2 * PRICE * 0.95
        else
          total += PRICE
        end
        @ordered_items = @ordered_items.map{|value| value-1}
        @ordered_items.delete_if{ |i| i == 0}
      end
    
    return total
  end
end
