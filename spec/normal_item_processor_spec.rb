require 'spec_helper'
require 'gilded_rose'
require 'normal_item_processor'

RSpec.describe NormalItemProcessor do
  let(:initial_sell_in) { 5 }
  let(:initial_quality) { 10 }
  let(:name) { ItemType::NORMAL }
  let(:item) { Item.new(name, initial_sell_in, initial_quality) }

  describe '#update' do
    subject { described_class.new(item) }

    before { subject.update }

    context 'before sell date' do
      it 'decreases quality by 1' do
        expect(subject.item.quality).to eq(initial_quality - 1)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end
    end

    context 'on sell date' do
      let(:initial_sell_in) { 0 }

      it 'decreases quality by 2' do
        expect(subject.item.quality).to eq(initial_quality - 2)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end
    end

    context 'after sell date' do
      let(:initial_sell_in) { -10 }

      it 'decreases quality by 2' do
        expect(subject.item.quality).to eq(initial_quality - 2)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end
    end

    context 'of zero quality' do
      let(:initial_quality) { 0 }

      it 'leaves quality as 0' do
        expect(subject.item.quality).to eq 0
      end
    end
  end
end
