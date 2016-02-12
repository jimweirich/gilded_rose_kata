class AgedBrieUpdater < Updater

  def initialize(item)
    super(item)
  end

  def update_quality!
    item.quality += 1
    item.quality += 1 if item.sell_in < 1
  end

  def update_sell_in!
    item.sell_in -= 1
  end

  def sanatize_quality!
    item.quality = 50 if item.quality > 50
    item.quality = 0  if item.quality < 0
  end

end
