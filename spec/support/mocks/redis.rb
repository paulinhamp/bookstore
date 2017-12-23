module Support 
  module Mocks
    class Redis
      def initialize
        @hash = {}
      end

      def set(key, value)
        @hash[key] = value.to_s
      end

      def get(key)
        @hash[key]
      end

      def del(key)
        @hash.delete(key)
      end
    end
  end
end