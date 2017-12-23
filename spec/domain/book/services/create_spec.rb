require 'rails_helper'

describe Domain::Book::Services::Create, type: :services do 
  let(:book) { build(:book) }

  before {
    allow(::Domain::Redis::RedisWrapper).to receive(:redis_client).and_return(::Support::Mocks::Redis.new)
    allow(InvalidateCacheWorker).to receive(:perform_async)
  }

  describe '.call' do
    context 'when invalid attributes' do
      before { book.title = nil }

      it 'should raise a validation error' do  
        expect { described_class.new(book: book).call }.to raise_error(
          ActiveRecord::RecordInvalid, 
          'Validation failed: Title can\'t be blank' 
        ) 
      end

      it { expect(::Book.count).to eq(0) }
    end

    context 'when valid attributes' do
      before {
        described_class.new(book: book).call
      }

      it { expect(::Book.count).to eq(1) }
      it { expect(::Book.first.title).to eq(book.title) }
      it { expect(::Book.first.authors.count).to eq(1) }
    end
  end
end