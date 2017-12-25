require 'rails_helper'

describe Domain::Author::Presenters::List, type: :presenters do 

  describe '.call' do
    context 'when call this presenter' do
      let(:mock_author) { double(::Domain::Author::Queries::List) }
      it 'should call right query' do
        expect(::Domain::Author::Queries::List).to receive(:new).and_return(mock_author)
        expect(mock_author).to receive(:call)
        described_class.new.call
      end
    end
  end
end