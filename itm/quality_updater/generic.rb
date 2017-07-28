class Itm
  class Factory
    class QualityUpdater
      class Generic

        UpdateNotImplemented = Class.new(NotImplementedError)

        def update(item)
          fail UpdateNotImplemented
        end


        protected

        def update_quality(item, operation, value)
          item.quality.send('=#{operation}', value)
        end

        def update_sell_in(item, operation, value)
          item.sell_in.send('=#{operation}', value)
        end
      end
    end
  end
end
