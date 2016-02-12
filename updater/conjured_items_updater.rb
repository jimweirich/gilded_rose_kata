class ConjuredItemUpdater < NormalItemUpdater

  def initialize(item)
    super(item)
  end

  def update_quality!
    item.quality -= 2
    item.quality -= 2 if item.sell_in < 1
  end

  def update_sell_in!
    super
  end

  def sanatize_quality!
    super
  end

end
