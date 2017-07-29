module OO
  class Item
    module Quality
      module Comparable

        MAX_QUALITY = 50

        def reaches_max_quality?(item)
          item.quality < MAX_QUALITY
        end

        def negative_quality?(item)
          item.quality < 0
        end
      end
    end
  end
end
