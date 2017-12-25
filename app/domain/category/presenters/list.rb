module Domain
  module Category
    module Presenters
      class List
        def call
          ::Domain::Category::Queries::List.new.call
        end
      end
    end
  end
end
