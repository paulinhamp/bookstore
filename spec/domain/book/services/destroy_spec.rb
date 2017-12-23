require 'rails_helper'

describe Domain::Book::Services::Destroy, type: :services do
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
      let!(:book_id) { book.id }

      before {
        expect(::Book.count).to eq(1)
        described_class.new(book_id: book_id).call
      }

      it { expect(::Book.count).to eq(0) }
    end
  end
end