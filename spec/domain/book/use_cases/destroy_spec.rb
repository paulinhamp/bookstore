require 'rails_helper'

describe Domain::Book::UseCases::Destroy, type: :usecases do
  describe '.call' do
    context 'when call presenter' do
      let(:destroy_mock) { double(::Domain::Book::Services::Destroy) }

      it 'should call destroy' do

        (1..100).each do |book_id|
          expect(::Domain::Book::Services::Destroy).to receive(:new).with(book_id: book_id).and_return(destroy_mock)
          expect(destroy_mock).to receive(:call)
          described_class.new('id' => book_id).call
        end
      end
    end
  end
end