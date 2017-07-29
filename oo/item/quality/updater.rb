module OO
  class Item
    module Quality
      module Updater
        def increase_quality!(item, value = 1)
          item.quality += value
        end

        def decrease_quality!(item, value = 1)
          item.quality -= value
        end

        def turn_zero_quality!(item)
          item.quality = 0
        end
      end
    end
  end
end
