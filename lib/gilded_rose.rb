def decrement_quality(item)
  item.quality -= 1 if item.quality > 0
end

def update_quality(items)
  items.each do |item|
    if item.name == 'NORMAL ITEM'
      decrement_quality(item)
    else
      item.quality += 1 if item.quality < 50

      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        if item.sell_in < 11
          item.quality += 1 if item.quality < 50
        end
        if item.sell_in < 6
          item.quality += 1 if item.quality < 50
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
        item.quality += 1 if item.quality < 50
      end
    end
  end
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
