module Domain
  module Book
    module Queries
      class Search
        def initialize(term:)
          @term = term
        end

        def call
          return all_books if @term.blank?
          ::Book.search(@term, fields: [:title, :synopsis])
        end

        private

        def all_books
          ::Domain::Book::Services::Cache::GetAll.new.call
        end
      end
    end
  end
end