def update_quality(items)
  items.each do |item|
    update(item)
  end
end

def update(item)
  if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
    if item.quality > 0
      item.quality -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
    end
  else
    if item.quality < 50
      item.quality += 1
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        item.quality += 1 if item.quality < 50 && item.sell_in < 11
        item.quality += 1 if item.quality < 50 && item.sell_in < 6
      end
    end
  end
  item.sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
  if item.sell_in < 0
    if item.name != 'Aged Brie'
      if item.name != 'Backstage passes to a TAFKAL80ETC concert'
        if item.quality > 0
          item.quality -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
        end
      else
        item.quality = item.quality - item.quality
      end
    else
      item.quality += 1 if item.quality < 50
    end
  end
  item
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
