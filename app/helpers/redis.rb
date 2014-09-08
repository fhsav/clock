Clock::Web.helpers do
  class Redis
    class << self
      def get(key)
        Ohm.redis.call('GET', key)
      end

      def set(key, value)
        Ohm.redis.call('SET', key, value)
      end
    end
  end
end
