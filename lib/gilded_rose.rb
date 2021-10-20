def decrement_quality(item)
  item.quality -= 1 if item.quality > 0
end

def increment_quality(item)
  item.quality += 1 if item.quality < 50
end

def update_quality(items)
  items.each do |item|
    if item.name == 'NORMAL ITEM'
      decrement_quality(item)
    else
      increment_quality(item)

      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        if item.sell_in < 11
          increment_quality(item)
        end
        if item.sell_in < 6
          increment_quality(item)
        end
      end
    end

    unless item.name == 'Sulfuras, Hand of Ragnaros'
      item.sell_in -= 1
    end

    if item.sell_in < 0
      if item.name != "Aged Brie" && item.name != 'Sulfuras, Hand of Ragnaros'
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          item.quality = item.quality - item.quality
        else
          decrement_quality(item)
        end
      else
        increment_quality(item)
      end
    end
  end
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
