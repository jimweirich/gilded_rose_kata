module OO
  class DailyUpdater::AgedBrie < DailyUpdater::Base

    def update
      if reaches_max_quality?(item)
        increase_quality!(item)
        increase_quality!(item) if sell_on_or_after_date?(item)
      end

      decrease_sell_in!(item)
    end
  end
end

