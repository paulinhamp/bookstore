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
          invalidate_cache
          @book
        end

        private
        
        def invalidate_cache
          InvalidateCacheWorker.perform_async
        end
      end
    end
  end
end