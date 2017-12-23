module Domain
  module Book
    module Services
      module Cache
        class Invalidate
          def call
            ::Domain::Redis::Services::Invalidate.new(key: 'books').call
          end
        end
      end
    end
  end
end