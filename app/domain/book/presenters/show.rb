module Domain
  module Book
    module Presenters
      class Show
        def initialize(params = {})
          @params = params
        end

        def call
          ::Domain::Book::Queries::Get.new(book_id: @params['id']).call
        end
      end
    end
  end
end