class Itm
  class Factory
    def call(name)
      case name
      when /Aged Brie/
        QualityUpdater::AgedBrie.new
      when /Backstage passes to a TAFKAL80ETC concert/
        QualityUpdater::BackstagePass.new
      when /Sulfuras, Hand of Ragnaros/
        QualityUpdater::Sulfuras.new
      when /Sulfuras, Hand of Ragnaros/
        QualityUpdater::Sulfuras.new
      when /Conjured/
        QualityUpdater::Conjured.new
      else
        QualityUpdater::Default.new
      end
    end
  end
end
