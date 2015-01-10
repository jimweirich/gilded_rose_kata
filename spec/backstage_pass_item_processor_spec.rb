require 'spec_helper'

RSpec.describe BackstagePassItemProcessor do
  let(:initial_sell_in) { 5 }
  let(:initial_quality) { 10 }
  let(:name) { GildedRose::BACKSTAGE_PASS }
  let(:item) { Item.new(name, initial_sell_in, initial_quality) }

  describe '#update' do
    subject { described_class.new(item) }

    before { subject.update }

    context 'long before sell date' do
      let(:initial_sell_in) { 11 }

      it 'increases quality by 1' do
        expect(subject.item.quality).to eq(initial_quality + 1)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'at max quality' do
        let(:initial_quality) { 50 }

        it 'leaves quality unchanged' do
          expect(subject.item.quality).to eq initial_quality
        end
      end
    end

    context 'medium close to sell date (upper bound)' do
      let(:initial_sell_in) { 10 }

      it 'increases quality by 2' do
        expect(subject.item.quality).to eq(initial_quality + 2)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'at max quality' do
        let(:initial_quality) { 50 }

        it 'leaves quality unchanged' do
          expect(subject.item.quality).to eq initial_quality
        end
      end
    end

    context 'medium close to sell date (lower bound)' do
      let(:initial_sell_in) { 6 }

      it 'increases quality by 2' do
        expect(subject.item.quality).to eq(initial_quality + 2)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'at max quality' do
        let(:initial_quality) { 50 }

        it 'leaves quality unchanged' do
          expect(subject.item.quality).to eq initial_quality
        end
      end
    end

    context 'very close to sell date (upper bound)' do
      let(:initial_sell_in) { 5 }

      it 'increases quality by 3' do
        expect(subject.item.quality).to eq(initial_quality + 3)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'at max quality' do
        let(:initial_quality) { 50 }

        it 'leaves quality unchanged' do
          expect(subject.item.quality).to eq initial_quality
        end
      end
    end

    context 'very close to sell date (lower bound)' do
      let(:initial_sell_in) { 1 }

      it 'increases quality by 3' do
        expect(subject.item.quality).to eq(initial_quality + 3)
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end

      context 'at max quality' do
        let(:initial_quality) { 50 }

        it 'leaves quality unchanged' do
          expect(subject.item.quality).to eq initial_quality
        end
      end
    end

    context 'on sell date' do
      let(:initial_sell_in) { 0 }

      it 'sets quality by 0' do
        expect(subject.item.quality).to eq 0
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end
    end

    context 'after sell date' do
      let(:initial_sell_in) { -10 }

      it 'sets quality by 0' do
        expect(subject.item.quality).to eq 0
      end

      it 'decreases sell_in by 1' do
        expect(subject.item.sell_in).to eq(initial_sell_in - 1)
      end
    end
  end
end
