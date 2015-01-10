require 'item_processor'

# DefaultItemProcessor
#
# Default behaviour to update an item
class DefaultItemProcessor < ItemProcessor
  def update
    item.sell_in -= 1
    modify_quality if update_quality?
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

  def modify_quality
    item.quality += after_sell_date? ? (quality_modifier * 2) : quality_modifier
  end
end
