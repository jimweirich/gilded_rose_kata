class Itm
  class Factory
    class QualityUpdater
      class AgedBrie < Generic

        def update(item)
          if item.quality < 50
            item.quality += 1
            item.quality += 1 if item.sell_in <= 0
          end

          item.sell_in -= 1
        end
      end
    end
  end
end

