module Domain
  module Redis
    module Services
      class Invalidate
        def initialize(key:)
          @key = key
        end

        def call
          ::Domain::Redis::RedisWrapper.redis_client.del(@key)
        end
      end
    end
  end
end