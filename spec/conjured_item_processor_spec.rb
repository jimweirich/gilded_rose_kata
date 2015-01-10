require 'spec_helper'

RSpec.describe ConjuredItemProcessor do
  let(:initial_sell_in) { 5 }
  let(:initial_quality) { 10 }
  let(:name) { GildedRose::CONJURED }
  let(:item) { Item.new(name, initial_sell_in, initial_quality) }

  describe '#update' do
    subject { described_class.new(item) }

    before { subject.update }

    context 'before the sell date' do
      it 'decreases quality by 2' do
        expect(subject.item.quality).to eq(initial_quality - 2)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'at zero quality' do
        let(:initial_quality) { 0 }

        it 'leaves quality unchanged' do
          expect(subject.item.quality).to eq initial_quality
        end
      end
    end

    context 'on sell date' do
      it 'decreases quality by 2' do
        expect(subject.item.quality).to eq(initial_quality - 2)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'at zero quality' do
        let(:initial_quality) { 0 }

        it 'leaves quality unchanged' do
          expect(subject.item.quality).to eq initial_quality
        end
      end
    end

    context 'after sell date' do
      it 'decreases quality by 2' do
        expect(subject.item.quality).to eq(initial_quality - 2)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'at zero quality' do
        let(:initial_quality) { 0 }

        it 'leaves quality unchanged' do
          expect(subject.item.quality).to eq initial_quality
        end
      end
    end
  end
end
