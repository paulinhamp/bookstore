require 'rails_helper'

describe Domain::Book::Queries::Get, type: :queries do
  let(:book) { create(:book) }

  describe '.call' do
    
    context 'when book_id is invalid' do

      it 'should raise a validation error' do  
        expect { described_class.new(book_id: 'invalid').call }.to raise_error(
          ActiveRecord::RecordNotFound,
          'Couldn\'t find Book with \'id\'=invalid'           
        ) 
      end
    end

    context 'when book_id is valid' do

      it 'should return the book' do
        expect(described_class.new(book_id: book.id).call).to eq(book)
      end
    end
  end
end