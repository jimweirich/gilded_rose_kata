require 'item_processor'

# NormalItemProcessor
#
# Updates a normal item
class NormalItemProcessor < ItemProcessor
  def update
    item.sell_in -= 1
    if item.quality > 0
      item.quality -= 1
      item.quality -= 1 if item.sell_in < 0
    end
    item
  end
end
