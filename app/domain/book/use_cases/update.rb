module Domain
  module Book
    module UseCases
      class Update
        def initialize(params)
          @params = params
        end

        def call
          ::Domain::Book::Services::Update.new(book: book, attributes: declared_params).call
        end

        private

        def declared_params
          @declared_params ||= @params.select { |k| k != 'id' }
        end

        def book
          @book ||= ::Book.find(@params['id'])
        end
      end
    end
  end
end