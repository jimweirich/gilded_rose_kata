require 'default_item_processor'

# NormalItemProcessor
#
# Updates a normal item
class NormalItemProcessor < DefaultItemProcessor
  private

  def update_quality?
    item.quality > 0
  end

  def quality_modifier
    -1
  end
end
