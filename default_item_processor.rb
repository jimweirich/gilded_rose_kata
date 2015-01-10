require 'item_processor'

# DefaultItemProcessor
#
# Default behaviour to update an item
class DefaultItemProcessor < ItemProcessor
  def update
    item.sell_in -= 1
    if update_quality?
      item.quality += quality_modifier
      item.quality += quality_modifier if after_sell_date?
    end
    item
  end

  private

  def update_quality?
    false
  end

  def after_sell_date?
    item.sell_in < 0
  end

  def quality_modifier
    0
  end
end
