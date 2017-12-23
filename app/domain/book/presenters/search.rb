module Domain
  module Book
    module Presenters
      class Search
        def initialize(params = {})
          @params = params
        end

        def call
          ::Domain::Book::Queries::Search.new(term: @params['q']).call
        end
      end
    end
  end
end