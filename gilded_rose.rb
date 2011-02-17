def update_quality(items)
  QualityUpdater.new.update(items)
end

class QualityUpdater
  def update(items)
    items.each do |item|
      update_one(item)
    end
  end

  private

  class NoopQualityUpdater
    def update_quality(item)
    end
    def update_sell_in(item)
    end
  end

  class BrieQualityUpdater
    def update_quality(item)
      if item.sell_in <= 0
        bump(item, 2)
      else
        bump(item, 1)
      end
    end
    def update_sell_in(item)
      item.sell_in -= 1
    end
    def bump(item, amount)
      item.quality += amount
      item.quality = 50 if item.quality >= 50
    end
  end

  class BackstagePassQualityUpdater
    def update_quality(item)
      if item.sell_in > 10
        bump(item, 1)
      elsif item.sell_in > 5
        bump(item, 2)
      elsif item.sell_in > 0
        bump(item, 3)
      else
        item.quality = 0
      end
    end
    def update_sell_in(item)
      item.sell_in -= 1
    end
    def bump(item, amount)
      item.quality += amount
      item.quality = 50 if item.quality >= 50
    end
  end

  class StandardQualityUpdater
    def update_quality(item)
      if item.sell_in <= 0
        bump(item, -2)
      else
        bump(item, -1)
      end
    end
    def update_sell_in(item)
      item.sell_in -= 1
    end
    def bump(item, amount)
      item.quality += amount
      item.quality = 50 if item.quality > 50
      item.quality = 0 if item.quality < 0
    end
  end

  def update_one(item)
    if item.name == 'Sulfuras, Hand of Ragnaros'
      updater = NoopQualityUpdater.new
    elsif item.name == 'Aged Brie'
      updater = BrieQualityUpdater.new
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      updater = BackstagePassQualityUpdater.new
    else
      updater = StandardQualityUpdater.new
    end

    if updater
      updater.update_quality(item)
      updater.update_sell_in(item)
      return
    end

    if item.quality > 0
      item.quality -= 1
    end

    item.sell_in -= 1
    if item.sell_in < 0
      if item.quality > 0
        item.quality -= 1
      end
    end
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

