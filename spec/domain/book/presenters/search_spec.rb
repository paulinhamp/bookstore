require 'rails_helper'

describe Domain::Book::Presenters::Search, type: :presenters do
  describe '.call' do
    context 'when call presenter' do
      let(:search_mock) { double(::Domain::Book::Queries::Search) }

      it 'should call right query' do

        %w(Crime Prejudice Beast Potter).each do |term|
          expect(::Domain::Book::Queries::Search).to receive(:new).with(term: term).and_return(search_mock)
          expect(search_mock).to receive(:call)
          described_class.new('q' => term).call
        end
      end
    end
  end
end