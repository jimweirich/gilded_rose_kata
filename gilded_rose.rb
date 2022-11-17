class Item
  attr_reader :name, :quality, :sell_in

  def initialize(name, sell_in, quality)
    @name, @sell_in, @quality = name, sell_in, quality
  end

  def tick
    if @name != 'Aged Brie' && @name != 'Backstage passes to a TAFKAL80ETC concert'
      if @quality > 0
        if @name != 'Sulfuras, Hand of Ragnaros'
          @quality -= 1
        end
      end
    else
      if @quality < 50
        @quality += 1
        if @name == 'Backstage passes to a TAFKAL80ETC concert'
          if @sell_in < 11
            if @quality < 50
              @quality += 1
            end
          end
          if @sell_in < 6
            if @quality < 50
              @quality += 1
            end
          end
        end
      end
    end
    if @name != 'Sulfuras, Hand of Ragnaros'
      @sell_in -= 1
    end
    if @sell_in < 0
      if @name != "Aged Brie"
        if @name != 'Backstage passes to a TAFKAL80ETC concert'
          if @quality > 0
            if @name != 'Sulfuras, Hand of Ragnaros'
              @quality -= 1
            end
          end
        else
          @quality = @quality - @quality
        end
      else
        if @quality < 50
          @quality += 1
        end
      end
    end
  end
end

def update_quality(items)
  items.each(&:tick)
end
