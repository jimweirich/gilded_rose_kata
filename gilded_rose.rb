def update_quality(items)
  items.each do |item|
    unless appreciating?(item) || ticketed?(item)
      if item.quality > 0
        unless legendary?(item)
          item.quality -= 1
        end
      end
    else
      if can_appreciate?(item)
        increment_quality(item)
        if ticketed?(item)
          if item.sell_in < 11
            if can_appreciate?(item)
              increment_quality(item)
            end
          end
          if item.sell_in < 6
            if can_appreciate?(item)
              increment_quality(item)
            end
          end
        end
      end
    end
    unless legendary?(item)
      item.sell_in -= 1
    end
    if item.sell_in < 0
      unless appreciating?(item)
        unless ticketed?(item)
          if item.quality > 0
            unless legendary?(item)
              item.quality -= 1
            end
          end
        else
          item.quality = 0
        end
      else
        if can_appreciate?(item)
          increment_quality(item)
        end
      end
    end
  end
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

def appreciating?(item)
 item.name == 'Aged Brie'
end

def ticketed?(item)
  item.name == 'Backstage passes to a TAFKAL80ETC concert'
end

def legendary?(item)
  item.name == 'Sulfuras, Hand of Ragnaros'
end

def max_quality
  50
end

def can_appreciate?(item)
  item.quality < max_quality
end

def increment_quality(item)
  item.quality += 1
end

