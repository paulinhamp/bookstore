require 'rails_helper'

describe Domain::Book::UseCases::Create, type: :usecases do
  describe '.call' do
    context 'when call presenter' do
      let(:book) { build(:book) }

      before {
        allow(::Domain::Redis::RedisWrapper).to receive(:redis_client).and_return(::Support::Mocks::Redis.new)
        allow(InvalidateCacheWorker).to receive(:perform_async)
      }

      it 'should call create' do
        new_book = described_class.new(book.as_json).call

        expect(new_book).to be_persisted
        expect(new_book.title).to eq(book.title)
      end
    end
  end
end