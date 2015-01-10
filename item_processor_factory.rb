require 'item_type'
require 'normal_item_processor'
require 'aged_brie_item_processor'
require 'sulfuras_item_processor'
require 'backstage_pass_item_processor'
require 'conjured_item_processor'

# ItemProcessorFactory
#
# Factory class for item processors
class ItemProcessorFactory
  def self.get_class(item)
    case item.name
    when ItemType::NORMAL then NormalItemProcessor.new(item)
    when ItemType::AGED_BRIE then AgedBrieItemProcessor.new(item)
    when ItemType::SULFURAS then SulfurasItemProcessor.new(item)
    when ItemType::BACKSTAGE_PASS then BackstagePassItemProcessor.new(item)
    when ItemType::CONJURED then ConjuredItemProcessor.new(item)
    else ItemProcessor.new(item)
    end
  end
end
