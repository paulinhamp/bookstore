module Domain
  module Book
    module Queries
      class Search
        def initialize(term:)
          @term = term
        end

        def call
          return ::Book.all if @term.blank?
          ::Book.search(@term, fields: [:title, :synopsis])
        end
      end
    end
  end
end