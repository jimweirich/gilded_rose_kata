require 'spec_helper'

RSpec.describe GildedRose do
  describe '#update_quality' do
    context 'with a single item' do
      let(:item) { Item.new(GildedRose::NORMAL, 5, 10) }

      before { described_class.new([item]).update_quality }

      it 'updates item quality' do
        expect(item.quality).to eq 9
      end

      it 'updates item sell_in' do
        expect(item.sell_in).to eq 4
      end
    end

    context 'with several items' do
      let(:item1) { Item.new(GildedRose::NORMAL, 5, 10) }
      let(:item2) { Item.new(GildedRose::AGED_BRIE, 3, 10) }
      let(:item3) { Item.new(GildedRose::BACKSTAGE_PASS, 4, 10) }
      let(:item4) { Item.new(GildedRose::SULFURAS, 2, 10) }
      let(:item5) { Item.new(GildedRose::CONJURED, 6, 10) }
      let(:items) { [item1, item2, item3, item4, item5] }

      before { described_class.new(items).update_quality }

      it 'updates each item quality' do
        expect(items.map(&:quality)).to eq([9, 11, 13, 10, 8])
      end

      it 'updates each item sell_in' do
        expect(items.map(&:sell_in)).to eq([4, 2, 3, 2, 5])
      end
    end
  end
end
