module Domain
  module Category
    module Queries
      class List
        def call
          ::Category.all
        end
      end
    end
  end
end