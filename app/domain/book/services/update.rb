module Domain
  module Book
    module Services
      class Update
        def initialize(book:, attributes:)
          @book       = book
          @attributes = attributes
        end

        def call
          @book.update_attributes!(@attributes)
          @book
        end
      end
    end
  end
end