require 'item'
require 'normal_item_processor'
require 'aged_brie_item_processor'
require 'sulfuras_item_processor'
require 'backstage_item_processor'
require 'conjured_item_processor'

# GildedRose
#
# Main class to process items
class GildedRose
  attr_reader :items

  NORMAL = 'NORMAL ITEM'
  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASS = 'Backstage passes to a TAFKAL80ETC concert'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'
  CONJURED = 'Conjured Mana Cake'

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each do |item|
      update(item)
    end
  end

  private

  def update(item)
    get_processor(item).update
  end

  def get_processor(item)
    case item.name
    when NORMAL then NormalItemProcessor.new(item)
    when AGED_BRIE then AgedBrieItemProcessor.new(item)
    when SULFURAS then SulfurasItemProcessor.new(item)
    when BACKSTAGE_PASS then BackstagePassItemProcessor.new(item)
    when CONJURED then ConjuredItemProcessor.new(item)
    end
  end
end
