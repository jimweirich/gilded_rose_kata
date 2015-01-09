require 'spec_helper'
require 'gilded_rose'

describe '#update_quality' do
  context 'with a single' do
    let(:initial_sell_in) { 5 }
    let(:initial_quality) { 10 }
    let(:item) { Item.new(name, initial_sell_in, initial_quality) }

    before { update_quality([item]) }

    context 'normal item' do
      let(:name) { 'NORMAL ITEM' }

      context 'before sell date' do
        it 'decreases quality by 1' do
          expect(item.quality).to eq(initial_quality - 1)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end
      end

      context 'on sell date' do
        let(:initial_sell_in) { 0 }

        it 'decreases quality by 2' do
          expect(item.quality).to eq(initial_quality - 2)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end
      end

      context 'after sell date' do
        let(:initial_sell_in) { -10 }

        it 'decreases quality by 2' do
          expect(item.quality).to eq(initial_quality - 2)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end
      end

      context 'of zero quality' do
        let(:initial_quality) { 0 }

        it 'leaves quality as 0' do
          expect(item.quality).to eq 0
        end
      end
    end

    context 'Aged Brie' do
      let(:name) { 'Aged Brie' }

      context 'before sell date' do
        it 'increases quality by 1' do
          expect(item.quality).to eq(initial_quality + 1)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end

        context 'with max quality' do
          let(:initial_quality) { 50 }

          it 'leaves quality as-is' do
            expect(item.quality).to eq initial_quality
          end

          it 'decreases sell_in by 1' do
            expect(item.sell_in).to eq(initial_sell_in - 1)
          end
        end
      end

      context 'on sell date' do
        let(:initial_sell_in) { 0 }

        it 'increases quality by 2' do
          expect(item.quality).to eq(initial_quality + 2)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end

        context "with max quality" do
          let(:initial_quality) { 50 }

          it 'leaves quality as-is' do
            expect(item.quality).to eq initial_quality
          end

          it 'decreases sell_in by 1' do
            expect(item.sell_in).to eq(initial_sell_in - 1)
          end
        end
      end

      context 'after sell date' do
        let(:initial_sell_in) { -10 }

        it 'increases initial_quality by 2' do
          expect(item.quality).to eq(initial_quality + 2)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end

        context 'with max quality' do
          let(:initial_quality) { 50 }

          it 'leaves quality as-is' do
            expect(item.quality).to eq initial_quality
          end

          it 'decreases sell_in by 1' do
            expect(item.sell_in).to eq(initial_sell_in - 1)
          end
        end
      end
    end

    context 'Sulfuras' do
      let(:initial_quality) { 80 }
      let(:name) { 'Sulfuras, Hand of Ragnaros' }

      context 'before sell date' do
        it 'leaves quality as-is' do
          expect(item.quality).to eq initial_quality
        end

        it 'leaves sell_in unchanged' do
          expect(item.sell_in).to eq initial_sell_in
        end
      end

      context 'on sell date' do
        let(:initial_sell_in) { 0 }

        it 'leaves quality as-is' do
          expect(item.quality).to eq initial_quality
        end

        it 'leaves sell_in unchanged' do
          expect(item.sell_in).to eq initial_sell_in
        end
      end

      context 'after sell date' do
        let(:initial_sell_in) { -10 }

        it 'leaves quality unchanged' do
          expect(item.quality).to eq initial_quality
        end

        it 'leaves sell_in unchanged' do
          expect(item.sell_in).to eq initial_sell_in
        end
      end
    end

    context 'Backstage pass' do
      let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }

      context 'long before sell date' do
        let(:initial_sell_in) { 11 }

        it 'increases quality by 1' do
          expect(item.quality).to eq(initial_quality + 1)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it 'leaves quality unchanged' do
            expect(item.quality).to eq initial_quality
          end
        end
      end

      context 'medium close to sell date (upper bound)' do
        let(:initial_sell_in) { 10 }

        it 'increases quality by 2' do
          expect(item.quality).to eq(initial_quality + 2)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it 'leaves quality unchanged' do
            expect(item.quality).to eq initial_quality
          end
        end
      end

      context 'medium close to sell date (lower bound)' do
        let(:initial_sell_in) { 6 }

        it 'increases quality by 2' do
          expect(item.quality).to eq(initial_quality + 2)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it 'leaves quality unchanged' do
            expect(item.quality).to eq initial_quality
          end
        end
      end

      context 'very close to sell date (upper bound)' do
        let(:initial_sell_in) { 5 }

        it 'increases quality by 3' do
          expect(item.quality).to eq(initial_quality + 3)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it 'leaves quality unchanged' do
            expect(item.quality).to eq initial_quality
          end
        end
      end

      context 'very close to sell date (lower bound)' do
        let(:initial_sell_in) { 1 }

        it 'increases quality by 3' do
          expect(item.quality).to eq(initial_quality + 3)
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it 'leaves quality unchanged' do
            expect(item.quality).to eq initial_quality
          end
        end
      end

      context 'on sell date' do
        let(:initial_sell_in) { 0 }

        it 'sets quality by 0' do
          expect(item.quality).to eq 0
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end
      end

      context 'after sell date' do
        let(:initial_sell_in) { -10 }

        it 'sets quality by 0' do
          expect(item.quality).to eq 0
        end

        it 'decreases sell_in by 1' do
          expect(item.sell_in).to eq(initial_sell_in - 1)
        end
      end
    end

    context 'conjured item' do
      context 'before the sell date' do
        it 'decreases quality by 2'
        it 'decreases sell_in by 1'

        context 'at zero quality' do
          it 'leaves quality unchanged'
        end
      end

      context 'on sell date' do
        it 'decreases quality by 2'
        it 'decreases sell_in by 1'

        context 'at zero quality' do
          it 'leaves quality unchanged'
        end
      end

      context 'after sell date' do
        it 'decreases quality by 2'
        it 'decreases sell_in by 1'

        context 'at zero quality' do
          it 'leaves quality unchanged'
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

    it 'updates item 1 quality' do
      expect(items[0].quality).to eq 9
    end

    it 'updates item 1 sell_in' do
      expect(items[0].sell_in).to eq 4
    end

    it 'updates item 2 quality' do
      expect(items[1].quality).to eq 11
    end

    it 'updates item 2 sell_in' do
      expect(items[1].sell_in).to eq 2
    end
  end
end
