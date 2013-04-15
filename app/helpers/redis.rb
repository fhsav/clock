Clock::Web.helpers do
  class Redis
    class << self
      def get(key)
        Ohm.redis.get key
      end

      def set(key, value)
        Ohm.redis.set key, value
      end
    end
  end
end
