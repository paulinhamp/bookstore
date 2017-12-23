module Domain
  module Redis
    class RedisWrapper
      def self.redis_client
        # :nocov:
        $redis
        # :nocov:
      end
    end
  end
end