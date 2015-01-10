require 'spec_helper'

RSpec.describe ItemProcessorFactory do
  describe '.get_class' do
    let(:item) { Item.new(type, 5, 10) }

    subject { described_class.get_class(item) }

    context 'with normal type' do
      let(:type) { ItemType::NORMAL }

      it 'returns instance of NormalItemProcessor' do
        expect(subject).to be_a NormalItemProcessor
      end
    end

    context 'with aged brie type' do
      let(:type) { ItemType::AGED_BRIE }

      it 'returns instance of AgedBrieItemProcessor' do
        expect(subject).to be_a AgedBrieItemProcessor
      end
    end

    context 'with sulfuras type' do
      let(:type) { ItemType::SULFURAS }

      it 'returns instance of SulfurasItemProcessor' do
        expect(subject).to be_a SulfurasItemProcessor
      end
    end

    context 'with backstage pass type' do
      let(:type) { ItemType::BACKSTAGE_PASS }

      it 'returns instance of BackstagePassItemProcessor' do
        expect(subject).to be_a BackstagePassItemProcessor
      end
    end

    context 'with conjured type' do
      let(:type) { ItemType::CONJURED }

      it 'returns instance of ConjuredItemProcessor' do
        expect(subject).to be_a ConjuredItemProcessor
      end
    end

    context 'with other type' do
      let(:type) { 'Random Thing' }

      it 'returns instance of ItemProcessor' do
        expect(subject).to be_a ItemProcessor
      end
    end
  end
end
