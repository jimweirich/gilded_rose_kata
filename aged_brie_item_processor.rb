require 'default_item_processor'

# AgedBrieItemProcessor
#
# Updates aged brie
class AgedBrieItemProcessor < DefaultItemProcessor
  private

  def update_quality?
    item.quality < 50
  end

  def quality_modifier
    1
  end
end
