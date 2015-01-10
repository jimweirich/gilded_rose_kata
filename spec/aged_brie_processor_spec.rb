require 'spec_helper'

RSpec.describe AgedBrieItemProcessor do
  let(:initial_sell_in) { 5 }
  let(:initial_quality) { 10 }
  let(:name) { ItemType::AGED_BRIE }
  let(:item) { Item.new(name, initial_sell_in, initial_quality) }

  describe '#update' do
    subject { described_class.new(item) }

    before { subject.update }

    context 'before sell date' do
      it 'increases quality by 1' do
        expect(subject.item.quality).to eq(initial_quality + 1)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'with max quality' do
        let(:initial_quality) { 50 }

        it 'leaves quality as-is' do
          expect(subject.item.quality).to eq initial_quality
        end

        it 'decreases sell_in by 1' do
          expect(subject.item.sell_in).to eq(initial_sell_in - 1)
        end
      end
    end

    context 'on sell date' do
      let(:initial_sell_in) { 0 }

      it 'increases quality by 2' do
        expect(subject.item.quality).to eq(initial_quality + 2)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'with max quality' do
        let(:initial_quality) { 50 }

        it 'leaves quality as-is' do
          expect(subject.item.quality).to eq initial_quality
        end

        it 'decreases sell_in by 1' do
          expect(subject.item.sell_in).to eq(initial_sell_in - 1)
        end
      end
    end

    context 'after sell date' do
      let(:initial_sell_in) { -10 }

      it 'increases initial_quality by 2' do
        expect(subject.item.quality).to eq(initial_quality + 2)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'with max quality' do
        let(:initial_quality) { 50 }

        it 'leaves quality as-is' do
          expect(subject.item.quality).to eq initial_quality
        end

        it 'decreases sell_in by 1' do
          expect(subject.item.sell_in).to eq(initial_sell_in - 1)
        end
      end
    end
  end
end
