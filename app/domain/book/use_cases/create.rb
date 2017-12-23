module Domain
  module Book
    module UseCases
      class Create
        def initialize(params)
          @params = params
        end

        def call
          ::Domain::Book::Services::Create.new(book: ::Book.new(@params)).call
        end
      end
    end
  end
end