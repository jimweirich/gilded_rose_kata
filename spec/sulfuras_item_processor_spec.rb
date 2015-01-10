require 'spec_helper'

RSpec.describe SulfurasItemProcessor do
  let(:initial_sell_in) { 5 }
  let(:initial_quality) { 10 }
  let(:name) { ItemType::SULFURAS }
  let(:item) { Item.new(name, initial_sell_in, initial_quality) }

  describe '#update' do
    subject { described_class.new(item) }

    before { subject.update }

    context 'before sell date' do
      it 'leaves quality unchanged' do
        expect(subject.item.quality).to eq initial_quality
      end

      it 'leaves sell_in unchanged' do
        expect(subject.item.sell_in).to eq initial_sell_in
      end
    end

    context 'on sell date' do
      let(:initial_sell_in) { 0 }

      it 'leaves quality unchanged' do
        expect(subject.item.quality).to eq initial_quality
      end

      it 'leaves sell_in unchanged' do
        expect(subject.item.sell_in).to eq initial_sell_in
      end
    end

    context 'after sell date' do
      let(:initial_sell_in) { -10 }

      it 'leaves quality unchanged' do
        expect(subject.item.quality).to eq initial_quality
      end

      it 'leaves sell_in unchanged' do
        expect(subject.item.sell_in).to eq initial_sell_in
      end
    end
  end
end
