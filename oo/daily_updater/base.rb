module OO
  class DailyUpdater::Base
    include DailyUpdater::Updatable
    include Item::Quality::Comparable
    include Item::SellIn::Comparable
    include Item::Quality::Updater
    include Item::SellIn::Updater

    attr_reader :item

    def initialize(item)
      @item = item
    end
  end
end

