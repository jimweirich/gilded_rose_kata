module OO
  class Factory
    def call(item)
      case item.name
      when /Aged Brie/
        ::OO::DailyUpdater::AgedBrie.new(item)
      when /Backstage passes to a TAFKAL80ETC concert/
        ::OO::DailyUpdater::Backstage.new(item)
      when /Sulfuras, Hand of Ragnaros/
        ::OO::DailyUpdater::Sulfuras.new(item)
      when /Sulfuras, Hand of Ragnaros/
        ::OO::DailyUpdater::Sulfuras.new(item)
      when /Conjured/
        ::OO::DailyUpdater::Conjured.new(item)
      else
        ::OO::DailyUpdater::Unknown.new(item)
      end
    end
  end
end
