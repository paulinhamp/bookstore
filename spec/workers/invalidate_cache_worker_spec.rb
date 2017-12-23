require 'rails_helper'
describe InvalidateCacheWorker, type: :worker do

  before {
    allow(::Domain::Redis::RedisWrapper).to receive(:redis_client).and_return(::Support::Mocks::Redis.new);
  }
  
  describe '.perform' do
    context 'when invalidate cache' do
      let!(:book) { create(:book) }

      before {
        ::Domain::Book::Services::Cache::GetAll.new.call
      }
      
      it 'should clear data' do
        book.destroy
        expect(::Domain::Book::Services::Cache::GetAll.new.call.count).to eq(1)
        described_class.new.perform
        expect(::Domain::Book::Services::Cache::GetAll.new.call.count).to eq(0)
      end
    end
  end
end
