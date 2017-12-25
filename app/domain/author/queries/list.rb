module Domain
  module Author
    module Queries
      class List
        def call
          ::Author.all
        end
      end
    end 
  end
end