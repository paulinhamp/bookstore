module Domain
  module Book
    module Services
      class Create
        def initialize(book:)
          @book = book
        end

        def call
          @book.save!
          @book
        end
      end
    end
  end
end