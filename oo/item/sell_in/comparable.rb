module OO
  class Item
    module SellIn
      module Comparable
        def sell_on_or_after_date?(item)
          item.sell_in < 1
        end

        def medium_upper_close_to_sell_date?(item)
          item.sell_in <= 10
        end

        def medium_lower_close_to_sell_date?(item)
          item.sell_in < 6
        end
      end
    end
  end
end
