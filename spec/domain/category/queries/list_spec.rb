require 'rails_helper'

describe Domain::Category::Queries::List, type: :queries do
  let!(:category) { create(:category) }

  describe '.call' do
    context 'when call' do
      it 'should return all categories' do
        expect(described_class.new.call).to eq([category])
      end
    end
  end
end