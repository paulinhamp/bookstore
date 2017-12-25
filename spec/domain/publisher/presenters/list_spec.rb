require 'rails_helper'

describe Domain::Publisher::Presenters::List, type: :presenters do 

  describe '.call' do
    context 'when call this presenter' do
      let(:mock_publisher) { double(::Domain::Publisher::Queries::List) }
      it 'should call right query' do
        expect(::Domain::Publisher::Queries::List).to receive(:new).and_return(mock_publisher)
        expect(mock_publisher).to receive(:call)
        described_class.new.call
      end
    end
  end
end