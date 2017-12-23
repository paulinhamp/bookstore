require 'rails_helper'

describe Domain::Book::Presenters::Show, type: :presenters do
  describe '.call' do
    context 'when call presenter' do
      let(:query_mock) { double(::Domain::Book::Queries::Get) }

      it 'should call right query' do

        (1..100).each do |book_id|
          expect(::Domain::Book::Queries::Get).to receive(:new).with(book_id: book_id).and_return(query_mock)
          expect(query_mock).to receive(:call)
          described_class.new('id' =>  book_id).call
        end
      end
    end
  end
end