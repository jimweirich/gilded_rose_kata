require 'spec_helper'

RSpec.describe ItemProcessor do
  let(:item) { double }

  describe '#initialize' do
    subject { described_class.new(item) }

    it 'stores item' do
      expect(subject.item).to eq item
    end
  end

  describe '#update' do
    subject { described_class.new(item).update }

    it 'returns nil' do
      expect(subject).to be nil
    end
  end
end
