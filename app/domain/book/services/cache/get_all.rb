module Domain
  module Book
    module Services
      module Cache
        class GetAll
          def call
            reload_cache if cached_books.nil?
            cached_books.map { |item| ::Book.new(item) }
          end

          private

          def reload_cache
            ::Domain::Redis::Services::Set.new(key: 'books', value: ::Book.all).call
          end

          def cached_books
            ::Domain::Redis::Services::Get.new(key: 'books').call.as_json
          end
        end
      end
    end
  end
end