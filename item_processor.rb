# ItemProcessor
#
# Abstract class to update an item
class ItemProcessor
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
  end
end
