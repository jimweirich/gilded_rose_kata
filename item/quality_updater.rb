class Item
  class QualityUpdater
    def call(item)
      updater_for(item).call
    end

    private

    def updater_for(item)
      factory.call(item.name)
    end

    def factory
      @_factory ||= Factory.new
    end
  end
end
