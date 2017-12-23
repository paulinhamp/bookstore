require 'rails_helper'

describe Domain::Book::Services::Update, type: :services do
  let(:book) { create(:book) }

  describe '.call' do
    context 'when title is invalid' do
      let(:attributes) { { title: '' } }

      it 'should raise a validation error' do  
        expect { described_class.new(book: book, attributes: attributes).call }.to raise_error(
          ActiveRecord::RecordInvalid, 
          'Validation failed: Title can\'t be blank' 
        ) 
      end
    end

    context 'when title is valid' do
      let(:attributes) { { title: Faker::Book.title } }

      before {
        described_class.new(book: book, attributes: attributes).call
      }

      it { expect(::Book.count).to eq(1) }
      it { expect(::Book.first.title).to eq(attributes[:title]) }
    end
  end
end