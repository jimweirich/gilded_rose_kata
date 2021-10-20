def update_quality(items)
  items.each do |item|
    case item.name
    when 'NORMAL ITEM'
      update_normal_item(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      update_backstage_pass(item)
    when 'Aged Brie'
      update_aged_brie(item)
    else # Sulfuras
      #No-Op
    end
  end
end

def update_normal_item(item)
  decrement_quality(item)
  item.sell_in -= 1
  decrement_quality(item) if expired?(item)
end

def update_backstage_pass(item)
  item.sell_in -= 1

  if expired?(item)
    item.quality = 0
  elsif item.sell_in < 5
    increment_quality(item, 3)
  elsif item.sell_in < 10
    increment_quality(item, 2)
  else
    increment_quality(item)
  end
end

def update_aged_brie(item)
  item.sell_in -= 1

  if expired?(item)
    increment_quality(item, 2)
  else
    increment_quality(item)
  end
end

def decrement_quality(item)
  item.quality -= 1 if item.quality > 0
end

def increment_quality(item, amount = 1)
  item.quality += amount
  item.quality = 50 if item.quality > 50
end

def expired?(item)
  item.sell_in < 0
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
