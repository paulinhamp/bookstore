module Domain
  module Book
    module UseCases
      class Destroy
        def initialize(params)
          @params = params
        end

        def call
          ::Domain::Book::Services::Destroy.new(book_id: book_id).call
        end

        private

        def book_id
          @params['id']
        end
      end
    end
  end
end