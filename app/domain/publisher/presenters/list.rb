module Domain
  module Publisher
    module Presenters
      class List
        def call
          ::Domain::Publisher::Queries::List.new.call
        end
      end
    end 
  end
end