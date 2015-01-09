require 'item_processor'

# ConjuredItemProcessor
#
# Updates a conjured item
class ConjuredItemProcessor < ItemProcessor
  def update
    item.sell_in -= 1
    item.quality -= 2 unless item.quality.zero?
    item
  end
end
