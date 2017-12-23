require 'rails_helper'

describe Domain::Book::Queries::Search, type: :queries do
  let!(:book1) { create(:book) }
  let!(:book2) { create(:book) }

  describe '.call' do
    context 'when no query' do
      it 'should return all books' do

        expect(described_class.new(term: '').call.count).to eq(2) 
      end
    end

    context 'when with query' do
      it 'should search into elasticsearch' do
        
        expect(Book).to receive(:search).with("Book", fields: [:title, :synopsis])
        described_class.new(term: "Book").call
      end
    end
  end
end