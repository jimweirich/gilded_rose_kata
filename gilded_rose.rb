require 'itm/factory'
require 'itm/quality_updater'
require 'itm/quality_updater/generic'
require 'itm/quality_updater/default'
require 'itm/quality_updater/sulfuras'
require 'itm/quality_updater/conjured'
require 'itm/quality_updater/aged_brie'
require 'itm/quality_updater/backstage_pass'


def update_quality(items)
  items.map { |i| Itm::QualityUpdater.new.call(i) }
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

