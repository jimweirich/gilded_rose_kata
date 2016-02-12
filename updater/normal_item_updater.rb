class NormalItemUpdater < Updater

  def initialize(item)
    super(item)
  end

  def update_quality!
    item.quality -= 1
    item.quality -= 1 if item.sell_in < 1
  end

  def update_sell_in!
    item.sell_in -= 1
  end

  def sanatize_quality!
    super
  end

end
