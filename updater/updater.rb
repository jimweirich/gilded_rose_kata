class Updater
  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def updater
    case item.name
    when 'Aged Brie'
      AgedBrieUpdater.new(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      BackstagePassesUpdater.new(item)
    when 'Sulfuras, Hand of Ragnaros'
      SulfurasUpdater.new(item)
    else
      NormalItemUpdater.new(item)
    end
  end

  def update
    updater.update_quality!
    updater.update_sell_in!
    updater.sanatize_quality!
  end

end
