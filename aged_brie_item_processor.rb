require 'item_processor'

# AgedBrieItemProcessor
#
# Updates aged brie
class AgedBrieItemProcessor < ItemProcessor
  def update
    item.sell_in -= 1
    if item.quality < 50
      item.quality += 1
      item.quality += 1 if item.sell_in < 0
    end
    item
  end
end
