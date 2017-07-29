module OO
  module DailyUpdater::Updatable

    UpdateMustBeImplemented = Class.new(NotImplementedError)

    def update
      fail UpdateMustBeImplemented
    end
  end
end
