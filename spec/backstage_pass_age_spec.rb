require 'spec_helper'

RSpec.describe BackstagePassAge do
  describe '#initialize' do
    let(:age) { 10 }

    subject { described_class.new(age) }

    it 'stores age' do
      expect(subject.age).to eq age
    end
  end

  describe '#additional_quality' do
    let(:age) { 5 }

    subject { described_class.new(age).additional_quality }

    context 'when age < 10' do
      context 'when age < 5' do
        let(:age) { 4 }

        it 'returns 3' do
          expect(subject).to eq 3
        end
      end

      context 'when age >= 5' do
        it 'returns 2' do
          expect(subject).to eq 2
        end
      end
    end

    context 'when age >= 10' do
      let(:age) { 20 }

      it 'returns 1' do
        expect(subject).to eq 1
      end
    end
  end
end
