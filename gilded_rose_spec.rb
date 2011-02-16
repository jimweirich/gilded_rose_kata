require 'rspec/given'
require 'gilded_rose'

describe "#update_quality_of" do
  Given(:sell_in) { 5 }
  Given(:quality) { 10 }

  When { update_quality_of(item) }

  context "with a normal item" do
    Given(:item) { Item.new("NORMAL ITEM", sell_in, quality) }

    context "before sell date" do
      Then { item.quality.should == quality - 1 }
      Then { item.sell_in.should == sell_in - 1 }
    end

    context "on sell date" do
      Given(:sell_in) { 0 }
      Then { item.quality.should == quality - 2 }
      Then { item.sell_in.should == sell_in - 1 }
    end

    context "after sell date" do
      Given(:sell_in) { -10 }
      Then { item.quality.should == quality - 2 }
      Then { item.sell_in.should == sell_in - 1 }
    end

    context "of zero quality" do
      Given(:quality) { 0 }
      Then { item.quality.should == 0 }
    end
  end

  context "with Aged Brie" do
    Given(:item) { Item.new("Aged Brie", sell_in, quality) }

    context "before sell date" do
      Then { item.quality.should == quality+1 }

      context "with max quality" do
        Given(:quality) { 50 }
        Then { item.quality.should == quality }
      end
    end

    context "on sell date" do
      Given(:sell_in) { 0 }
      Then { item.quality.should == quality+2 }
    end

    context "after sell date" do
      Given(:sell_in) { -10 }
      Then { item.quality.should == quality+2 }

      context "with max quality" do
        Given(:quality) { 50 }
        Then { item.quality.should == quality }
      end
    end
  end

  context "with  Sulfuras" do
    Given(:quality) { 80 }
    Given(:item) { Item.new("Sulfuras, Hand of Ragnaros", sell_in, quality) }

    context "before sell date" do
      Then { item.quality.should == quality }
      Then { item.sell_in.should == sell_in }
    end

    context "on sell date" do
      Given(:sell_in) { 0 }
      Then { item.quality.should == quality }
      Then { item.sell_in.should == sell_in }
    end

    context "after sell date" do
      Given(:sell_in) { -10 }
      Then { item.quality.should == quality }
      Then { item.sell_in.should == sell_in }
    end
  end

  context "with Backstage passes" do
    Given(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", sell_in, quality) }

    context "long before sell date" do
      Given(:sell_in) { 11 }
      Then { item.quality.should == quality+1 }
      Then { item.sell_in.should == sell_in-1 }

      context "at max quality" do
        Given(:quality) { 50 }
        Then { item.quality.should == quality }
      end
    end

    context "closer to sell date" do
      Given(:sell_in) { 10 }
      Then { item.quality.should == quality+2 }
      Then { item.sell_in.should == sell_in-1 }

      context "at max quality" do
        Given(:quality) { 50 }
        Then { item.quality.should == quality }
      end
    end

    context "on sell date" do
      Given(:sell_in) { 0 }
      Then { item.quality.should == 0 }
      Then { item.sell_in.should == sell_in-1 }
    end

    context "after sell date" do
      Given(:sell_in) { -10 }
      Then { item.quality.should == 0 }
      Then { item.sell_in.should == sell_in-1 }
    end
  end
end
