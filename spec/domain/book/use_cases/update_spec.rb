require 'rails_helper'

describe Domain::Book::UseCases::Update, type: :usecases do
  describe '.call' do
    context 'when call update' do
      let(:update_mock) { double(::Domain::Book::Services::Update) }
      let(:params)      { { title: Faker::Book.title }.as_json }
      let(:book)        { create(:book) }

      it 'should call update' do

        expect(::Domain::Book::Services::Update).to receive(:new).with(book: book, attributes: params).and_return(update_mock)
        expect(update_mock).to receive(:call)
        described_class.new(params.merge(id: book.id).as_json).call
      end
    end
  end
end