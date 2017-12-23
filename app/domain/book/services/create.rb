module Domain
  module Book
    module Services
      class Create
        def initialize(book:)
          @book = book
        end

        def call
          @book.save!
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