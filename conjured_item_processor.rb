require 'default_item_processor'

# ConjuredItemProcessor
#
# Updates a conjured item
class ConjuredItemProcessor < DefaultItemProcessor
  private

  def update_quality?
    !item.quality.zero?
  end

  def quality_modifier
    -2
  end
end
