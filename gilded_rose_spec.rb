require 'rspec/given'
require 'gilded_rose'

describe "#update_quality_of" do
  Given(:sell_in) { 5 }
  Given(:quality) { 10 }
  Given(:item) { Item.new(name, sell_in, quality) }

  When { update_quality_of(item) }

  context "with a normal item" do
    Given(:name) { "NORMAL ITEM" }

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
    Given(:name) { "Aged Brie" }

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
    Given(:name) { "Sulfuras, Hand of Ragnaros" }

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
    Given(:name) { "Backstage passes to a TAFKAL80ETC concert" }

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

  context "with conjured items" do
    before { pending }
    Given(:name) { "Conjured Mana Cake" }

    context "before the sell date" do
      Given(:sell_in) { 5 }
      Then { item.quality.should == quality-2 }
      Then { item.sell_in.should == sell_in-1 }

      context "at zero quality" do
        Given(:quality) { 0 }
        Then { item.quality.should == quality }
      end
    end

    context "on sell date" do
      Given(:sell_in) { 0 }
      Then { item.quality.should == quality-2 }
      Then { item.sell_in.should == sell_in-1 }

      context "at zero quality" do
        Given(:quality) { 0 }
        Then { item.quality.should == quality }
      end
    end

    context "after sell date" do
      Given(:sell_in) { -10 }
      Then { item.quality.should == quality-2 }
      Then { item.sell_in.should == sell_in-1 }

      context "at zero quality" do
        Given(:quality) { 0 }
        Then { item.quality.should == quality }
      end
    end
  end
end
