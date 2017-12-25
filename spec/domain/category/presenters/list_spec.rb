require 'rails_helper'

describe Domain::Category::Presenters::List, type: :presenters do 

  describe '.call' do
    context 'when call this presenter' do
      let(:mock_category) { double(::Domain::Category::Queries::List) }
      it 'should call right query' do
        expect(::Domain::Category::Queries::List).to receive(:new).and_return(mock_category)
        expect(mock_category).to receive(:call)
        described_class.new.call
      end
    end
  end
end