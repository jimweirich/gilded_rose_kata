module OO
  class DailyUpdater::Backstage < DailyUpdater::Base
    def update
      if reaches_max_quality?(item)
        increase_quality!(item)

        if medium_upper_close_to_sell_date?(item)
          increase_quality!(item)

          increase_quality!(item) if medium_lower_close_to_sell_date?(item)
        end
      end

      turn_zero_quality!(item) if sell_on_or_after_date?(item)

      decrease_sell_in!(item)
    end
  end
end
