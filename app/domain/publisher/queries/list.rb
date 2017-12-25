module Domain
  module Publisher
    module Queries
      class List
        def call
          ::Publisher.all
        end
      end
    end
  end
end