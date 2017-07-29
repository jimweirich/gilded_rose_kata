module OO
  class Item
    module SellIn
      module Updater
        def increase_sell_in!(item, value = 1)
          item.sell_in += value
        end

        def decrease_sell_in!(item, value = 1)
          item.sell_in -= value
        end
      end
    end
  end
end


