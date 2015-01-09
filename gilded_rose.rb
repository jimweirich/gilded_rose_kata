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
    case item.name
    when NORMAL
      update_normal(item)
    when AGED_BRIE
      update_brie(item)
    when SULFURAS
      update_sulfuras(item)
    when BACKSTAGE_PASS
      update_pass(item)
    end
  end

  def update_normal(item)
    item.quality -= 1 if item.quality > 0 && item.name != SULFURAS
    item.sell_in -= 1
    item.quality -= 1 if item.quality > 0 && item.sell_in < 0
    item
  end

  def update_brie(item)
    item.quality += 1 if item.quality < 50
    item.sell_in -= 1
    item.quality += 1 if item.sell_in < 0 && item.quality < 50
    item
  end

  def update_sulfuras(item)
    item
  end

  def update_pass(item)
    if item.quality < 50
      item.quality += 1
      if item.quality < 50
        item.quality += 1 if item.sell_in < 11
        item.quality += 1 if item.sell_in < 6
      end
    end
    item.sell_in -= 1
    item.quality = 0 if item.sell_in < 0
    item
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
