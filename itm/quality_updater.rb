class Itm
  class QualityUpdater
    def call(item)
      updater_for(item.name).update(item)
    end

    private

    def updater_for(name)
      factory.call(name)
    end

    def factory
      @_factory ||= Factory.new
    end
  end
end
