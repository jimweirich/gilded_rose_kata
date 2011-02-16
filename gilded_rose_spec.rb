require 'rspec/given'
require 'gilded_rose'

describe "#update_quality" do

  # Horrible hack because +update_quality+ has a bad interface for
  # testing.
  def update_items(items)
    old_items = Items.dup
    Items.clear
    items.each do |i| Items << i end
    update_quality
  ensure
    Items.clear
    old_items.each do |i| Items << i end
  end

  context "with a single" do
    Given(:sell_in) { 5 }
    Given(:quality) { 10 }
    Given(:item) { Item.new(name, sell_in, quality) }

    When { update_items([item]) }

    context "normal item" do
      Given(:name) { "NORMAL ITEM" }

      context "before sell date" do
        Then { item.quality.should == quality-1 }
        Then { item.sell_in.should == sell_in-1 }
      end

      context "on sell date" do
        Given(:sell_in) { 0 }
        Then { item.quality.should == quality-2 }
        Then { item.sell_in.should == sell_in-1 }
      end

      context "after sell date" do
        Given(:sell_in) { -10 }
        Then { item.quality.should == quality-2 }
        Then { item.sell_in.should == sell_in-1 }
      end

      context "of zero quality" do
        Given(:quality) { 0 }
        Then { item.quality.should == 0 }
      end
    end

    context "Aged Brie" do
      Given(:name) { "Aged Brie" }

      context "before sell date" do
        Then { item.quality.should == quality+1 }
        Then { item.sell_in.should == sell_in-1 }

        context "with max quality" do
          Given(:quality) { 50 }
          Then { item.quality.should == quality }
          Then { item.sell_in.should == sell_in-1 }
        end
      end

      context "on sell date" do
        Given(:sell_in) { 0 }
        Then { item.quality.should == quality+2 }
        Then { item.sell_in.should == sell_in-1 }
      end

      context "after sell date" do
        Given(:sell_in) { -10 }
        Then { item.quality.should == quality+2 }
        Then { item.sell_in.should == sell_in-1 }

        context "with max quality" do
          Given(:quality) { 50 }
          Then { item.quality.should == quality }
          Then { item.sell_in.should == sell_in-1 }
        end
      end
    end

    context "Sulfuras" do
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

    context "Backstage pass" do
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

    context "conjured item" do
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

  context "with several objects" do
    Given(:items) {
      [
        Item.new("NORMAL ITEM", 5, 10),
        Item.new("Aged Brie", 3, 10),
      ]
    }

    When { update_items(items) }

    Then { items[0].quality.should == 9 }
    Then { items[0].sell_in.should == 4 }

    Then { items[1].quality.should == 11 }
    Then { items[1].sell_in.should == 2 }
  end
end
