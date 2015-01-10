require 'item'
require 'item_processor_factory'

# GildedRose
#
# Main class to process items
class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each do |item|
      ItemProcessorFactory.get_class(item).update
    end
  end
end
