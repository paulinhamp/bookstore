module Domain
  module Book
    module Services
      class Destroy
        def initialize(book_id:)
          @book_id = book_id
          validate_params
        end

        def call
          ::Book.find(@book_id).destroy
        end

        def validate_params
          fail ArgumentError, 'Parameter "book_id" is required!' if @book_id.nil?
        end
      end
    end
  end
end