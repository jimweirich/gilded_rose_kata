require 'spec_helper'

RSpec.describe DefaultItemProcessor do
  let(:initial_sell_in) { 5 }
  let(:initial_quality) { 10 }
  let(:name) { GildedRose::NORMAL }
  let(:item) { Item.new(name, initial_sell_in, initial_quality) }

  describe '#update' do
    subject { described_class.new(item) }

    before do
      allow(subject).to receive(:update_quality?).and_return true
      subject.update
    end

    context 'before sell date' do
      it 'does not change quality' do
        expect(subject.item.quality).to eq initial_quality
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end
    end

    context 'on sell date' do
      let(:initial_sell_in) { 0 }

      it 'does not change quality' do
        expect(subject.item.quality).to eq initial_quality
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end
    end

    context 'after sell date' do
      let(:initial_sell_in) { -10 }

      it 'does not change quality' do
        expect(subject.item.quality).to eq initial_quality
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end
    end
  end
end
