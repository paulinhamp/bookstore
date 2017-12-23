module Domain
  module Book
    module Queries
      class Get
        def initialize(book_id:)
          @book_id = book_id
        end

        def call
          ::Book.find(@book_id)
        end

        def validate_params
          fail ArgumentError, 'Parameter "book_id" is required!' if @book_id.nil?
        end
      end
    end
  end
end