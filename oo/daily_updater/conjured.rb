module OO
  class DailyUpdater::Conjured < DailyUpdater::Base

    def update
      decrease_quality!(item, 2)
      decrease_sell_in!(item)

      turn_zero_quality!(item) if negative_quality?(item)
    end
  end
end
