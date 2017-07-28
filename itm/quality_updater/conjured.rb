class Itm
  class Factory
    class QualityUpdater
      class Conjured < Generic

        def update(item)
          item.quality -= 2
          item.sell_in -= 1

          item.quality = 0 if item.quality < 1
        end
      end
    end
  end
end
