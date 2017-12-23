module Domain
  module Redis
    module Services
      class Set
        def initialize(key:, value:)
          @key   = key
          @value = value
        end

        def call
          ::Domain::Redis::RedisWrapper.redis_client.set(@key, @value.to_json)
        end
      end
    end
  end
end