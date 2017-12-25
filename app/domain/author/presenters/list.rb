module Domain
  module Author
    module Presenters
      class List
        def call
          ::Domain::Author::Queries::List.new.call
        end
      end
    end 
  end 
end