# BackstagePassAge
#
# Utility class to perform calculations based on age
class BackstagePassAge
  attr_reader :age

  def initialize(age)
    @age = age
  end

  def additional_quality
    if age < 10
      return 3 if age < 5
      return 2
    end
    1
  end
end
