module Domain
  module Redis
    module Services
      class Get
        def initialize(key:)
          @key = key
        end

        def call
          data = ::Domain::Redis::RedisWrapper.redis_client.get(@key)
          JSON.load(data)
        end
      end
    end
  end
end