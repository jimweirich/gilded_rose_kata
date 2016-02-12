require 'require_all'
require_all 'updater'

def update_quality(items)
  items.each do |item|
    if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
      if item.name != 'Sulfuras, Hand of Ragnaros'
        # normal
        # item.quality -= 1
      end
    else
      # brie, backstage
      # item.quality += 1

      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        # backstage passes
        # if item.sell_in < 11
        #   item.quality += 1
        # end
        # if item.sell_in < 6
        #   item.quality += 1
        # end
      end

    end
    if item.name != 'Sulfuras, Hand of Ragnaros'
      # normal, backstage, brie
      # item.sell_in -= 1
    end
    if item.sell_in < 0
      if item.name != "Aged Brie"
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          if item.name != 'Sulfuras, Hand of Ragnaros'
            # normal
            # item.quality -= 1
          end
        else
          # backstage passes
          # item.quality = item.quality - item.quality
        end
      else
        # aged brie
        # item.quality += 1
      end
    end

    updater = Updater.new(item)
    updater.update
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

