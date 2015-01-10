require 'item_processor'

# BackstagePassItemProcessor
#
# Updates backstage pass
class BackstagePassItemProcessor < ItemProcessor
  def update
    item.sell_in -= 1
    update_quality(item) if update_quality?
    item
  end

  def update_quality(item)
    if item.sell_in < 0
      item.quality = 0
    elsif item.quality < 50
      item.quality += additional_quality_based_on_age(item.sell_in)
    end
    item
  end

  def additional_quality_based_on_age(sell_in)
    if sell_in < 10
      return 3 if sell_in < 5
      return 2
    end
    1
  end

  private

  def update_quality?
    item.sell_in < 0 || item.quality < 50
  end
end
