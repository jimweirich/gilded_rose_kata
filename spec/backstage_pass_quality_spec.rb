require 'spec_helper'

RSpec.describe BackstagePassQuality do
  let(:quality) { 5 }
  let(:age) { 10 }
  let(:item) { Item.new(GildedRose::BACKSTAGE_PASS, age, quality) }

  describe '#initialize' do
    subject { described_class.new(item) }

    it 'stores quality' do
      expect(subject.quality).to eq item.quality
    end

    it 'stores age' do
      expect(subject.age).to eq item.sell_in
    end
  end

  describe '#calculate' do
    subject { described_class.new(item).calculate }

    context 'when age < 0' do
      let(:age) { -2 }

      it 'returns 0' do
        expect(subject).to eq 0
      end
    end

    context 'when age >= 0' do
      let(:age) { 5 }

      context 'when quality < 50' do
        let(:quality) { 45 }

        it 'calculates new quality' do
          expect(subject).to eq 47
        end
      end

      context 'when quality >= 50' do
        let(:quality) { 51 }

        it 'returns quality' do
          expect(subject).to eq 51
        end
      end
    end
  end
end
