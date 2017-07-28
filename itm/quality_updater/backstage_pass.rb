class Itm
  class Factory
    class QualityUpdater
      class BackstagePass < Generic

        def update(item)
          if item.quality < 50
            item.quality += 1

            if item.sell_in <= 10
              item.quality += 1

              item.quality += 1 if item.sell_in < 6
            end
          end

          item.quality = 0 if item.sell_in <= 0

          item.sell_in -= 1
        end
      end
    end
  end
end

