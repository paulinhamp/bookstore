require 'rails_helper'

describe Domain::Publisher::Queries::List, type: :queries do
  let!(:publisher) { create(:publisher) }

  describe '.call' do
    context 'when call' do
      it 'should return all publishers' do
        expect(described_class.new.call).to eq([publisher])
      end
    end
  end
end