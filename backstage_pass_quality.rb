require 'backstage_pass_age'

# BackstagePassQuality
#
# Utility class to perform calculations based on age/quality
class BackstagePassQuality
  attr_reader :quality, :age

  def initialize(item)
    @quality = item.quality
    @age = item.sell_in
  end

  def calculate
    return 0 if age < 0
    if quality < 50
      quality + BackstagePassAge.new(age).additional_quality
    else
      quality
    end
  end
end
