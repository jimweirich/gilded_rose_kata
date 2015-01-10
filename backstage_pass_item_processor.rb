require 'item_processor'
require 'backstage_pass_quality'

# BackstagePassItemProcessor
#
# Updates backstage pass
class BackstagePassItemProcessor < ItemProcessor
  def update
    item.sell_in -= 1
    item.quality = BackstagePassQuality.new(item).calculate if update_quality?
    item
  end

  private

  def update_quality?
    item.sell_in < 0 || item.quality < 50
  end
end
