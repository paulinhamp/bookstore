require 'rails_helper'

describe Domain::Author::Queries::List, type: :queries do
  let!(:author) { create(:author) }

  describe '.call' do
    context 'when call' do
      it 'should return all authors' do
        expect(described_class.new.call).to eq([author])
      end
    end
  end
end