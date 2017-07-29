module OO
  class DailyUpdater
    def call(item)
      updater_for(item).update
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
