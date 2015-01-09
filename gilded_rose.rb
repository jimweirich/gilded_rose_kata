# GildedRose
#
# Main class to process items
class GildedRose
  attr_reader :items

  NORMAL = 'NORMAL ITEM'
  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASS = 'Backstage passes to a TAFKAL80ETC concert'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'

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
    when NORMAL
      NormalItemProcessor.new(item)
    when AGED_BRIE
      BrieItemProcessor.new(item)
    when SULFURAS
      SulfurasItemProcessor.new(item)
    when BACKSTAGE_PASS
      BackstagePassItemProcessor.new(item)
    end
  end
end

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

# NormalItemProcessor
#
# Updates a normal item
class NormalItemProcessor < ItemProcessor
  def update
    item.sell_in -= 1
    if item.quality > 0
      item.quality -= 1
      item.quality -= 1 if item.sell_in < 0
    end
    item
  end
end

# BrieItemProcessor
#
# Updates aged brie
class BrieItemProcessor < ItemProcessor
  def update
    item.sell_in -= 1
    if item.quality < 50
      item.quality += 1
      item.quality += 1 if item.sell_in < 0
    end
    item
  end
end

# SulfurasItemProcessor
#
# Updates sulfuras
class SulfurasItemProcessor < ItemProcessor
end

# BackstagePassItemProcessor
#
# Updates backstage pass
class BackstagePassItemProcessor < ItemProcessor
  def update
    item.sell_in -= 1
    update_quality(item)
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
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
