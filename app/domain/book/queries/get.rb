module Domain
  module Book
    module Queries
      class Get
        def initialize(book_id:)
          @book_id = book_id
        end

        def call
          book = books_from_cache.select { |book| book.id == @book_id }.first

          return ::Book.find(@book_id) if book.nil?
          book
        end

        def books_from_cache
          @books_from_cache ||= ::Domain::Book::Services::Cache::GetAll.new.call
        end
      end
    end
  end
end