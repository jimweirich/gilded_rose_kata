require 'rspec'
require 'lib/gilded_rose'

RSpec.describe 'update_quality' do
  context 'with a single' do
    let(:initial_sell_in) { 5 }
    let(:initial_quality) { 10 }

    let(:item) { Item.new(name, initial_sell_in, initial_quality) }

    before { update_quality([item]) }

    context 'normal item' do
      let(:name) { 'NORMAL ITEM' }

      before { expect(item.sell_in).to eq(initial_sell_in - 1) }

      context 'before sell date' do
        it { expect(item.quality).to eq(initial_quality - 1) }
      end

      context 'on sell date' do
        let(:initial_sell_in) { 0 }

        it { expect(item.quality).to eq(initial_quality - 2) }
      end

      context 'after sell date' do
        let(:initial_sell_in) { -10 }
        it { expect(item.quality).to eq(initial_quality - 2) }
      end

      context 'of zero quality' do
        let(:initial_quality) { 0 }
        it { expect(item.quality).to eq(0) }
      end
    end

    context 'Aged Brie' do
      let(:name) { 'Aged Brie' }

      before { expect(item.sell_in).to eq(initial_sell_in - 1) }

      context 'before sell date' do
        it { expect(item.quality).to eq(initial_quality + 1) }

        context 'with max quality' do
          let(:initial_quality) { 50 }

          it { expect(item.quality).to eq(initial_quality) }
        end
      end

      context 'on sell date' do
        let(:initial_sell_in) { 0 }

        it { expect(item.quality).to eq(initial_quality + 2) }

        context 'near max quality' do
          let(:initial_quality) { 49 }

          it { expect(item.quality).to eq(50) }
        end

        context 'with max quality' do
          let(:initial_quality) { 50 }

          it { expect(item.quality).to eq(initial_quality) }
        end
      end

      context 'after sell date' do
        let(:initial_sell_in) { -10 }

        it { expect(item.quality).to eq(initial_quality + 2) }

        context 'with max quality' do
          let(:initial_quality) { 50 }

          it { expect(item.quality).to eq(initial_quality) }
        end
      end
    end

    context 'Sulfuras' do
      let(:initial_quality) { 80 }
      let(:name) { "Sulfuras, Hand of Ragnaros" }

      before { expect(item.sell_in).to eq(initial_sell_in) }

      context 'before sell date' do
        it { expect(item.quality).to eq(initial_quality) }
      end

      context 'on sell date' do
        let(:initial_sell_in) { 0 }

        it { expect(item.quality).to eq(initial_quality) }
      end

      context 'after sell date' do
        let(:initial_sell_in) { -10 }

        it { expect(item.quality).to eq(initial_quality) }
      end
    end

    context 'Backstage pass' do
      let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }

      before { expect(item.sell_in).to eq(initial_sell_in - 1) }

      context 'long before sell date' do
        let(:initial_sell_in) { 11 }

        it { expect(item.quality).to eq(initial_quality + 1) }

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it { expect(item.sell_in).to eq(initial_sell_in - 1) }
        end
      end

      context 'medium close to sell date (upper bound)' do
        let(:initial_sell_in) { 10 }

        it { expect(item.quality).to eq(initial_quality + 2) }

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it { expect(item.quality).to eq(initial_quality) }
        end
      end

      context 'medium close to sell date (lower bound)' do
        let(:initial_sell_in) { 6 }

        it { expect(item.quality).to eq(initial_quality + 2) }

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it { expect(item.quality).to eq(initial_quality) }
        end
      end

      context 'very close to sell date (upper bound)' do
        let(:initial_sell_in) { 5 }

        it { expect(item.quality).to eq(initial_quality + 3) }

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it { expect(item.quality).to eq(initial_quality) }
        end
      end

      context 'very close to sell date (lower bound)' do
        let(:initial_sell_in) { 1 }

        it { expect(item.quality).to eq(initial_quality + 3) }

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it { expect(item.quality).to eq(initial_quality) }
        end
      end

      context 'on sell date' do
        let(:initial_sell_in) { 0 }

        it { expect(item.quality).to eq(0) }
      end

      context 'after sell date' do
        let(:initial_sell_in) { -10 }

        it { expect(item.quality).to eq(0) }
      end
    end

    context 'conjured item' do
      let(:name) { 'Conjured Mana Cake' }

      before { expect(item.sell_in).to eq(initial_sell_in - 1) }

      context 'before the sell date' do
        let(:initial_sell_in) { 5 }

        xit { expect(item.quality).to eq(initial_quality - 2) }

        context 'at zero quality' do
          let(:initial_quality) { 0 }

          xit { expect(item.quality).to eq(initial_quality) }
        end
      end

      context 'on sell date' do
        let(:initial_sell_in) { 0 }

        xit { expect(item.quality).to eq(initial_quality - 4) }

        context 'at zero quality' do
          let(:initial_quality) { 0 }

          xit { expect(item.quality).to eq(initial_quality) }
        end
      end

      context 'after sell date' do
        let(:initial_sell_in) { -10 }

        xit { expect(item.quality).to eq(initial_quality - 4) }

        context 'at zero quality' do
          let(:initial_quality) { 0 }

          xit { expect(item.quality).to eq(initial_quality) }
        end
      end
    end
  end

  context 'with several objects' do
    let(:items) {
      [
        Item.new('NORMAL ITEM', 5, 10),
        Item.new('Aged Brie', 3, 10),
      ]
    }

    before { update_quality(items) }

    it { expect(items[0].quality).to eq(9) }
    it { expect(items[0].sell_in).to eq(4) }
    it { expect(items[1].quality).to eq(11) }
    it { expect(items[1].sell_in).to eq(2) }
  end
end
