def decrement_quality(item)
  item.quality -= 1 if item.quality > 0
end

def increment_quality(item, amount = 1)
  item.quality += amount if item.quality < 50
end

def expired?(item)
  item.sell_in < 0
end

def update_quality(items)
  items.each do |item|
    case item.name
    when 'NORMAL ITEM'
      decrement_quality(item)
      item.sell_in -= 1
      decrement_quality(item) if expired?(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      if item.sell_in < 6
        increment_quality(item, 3)
      elsif item.sell_in < 11
        increment_quality(item, 2)
      else
        increment_quality(item)
      end

      item.sell_in -= 1

      item.quality = item.quality - item.quality if expired?(item)
    when 'Aged Brie'
      increment_quality(item)
      item.sell_in -= 1
      increment_quality(item) if expired?(item)
    else # Sulfuras
      #No-Op
    end
  end
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
