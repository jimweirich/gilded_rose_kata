class Item
  class Factory
    class QualityUpdater
      class AgedBrie < Generic

        def update(item)
          update_quality(item, '+', 1) if quality < 50
          update_sell_in(item, '-', 1)


        end
      end
    end
  end
end

