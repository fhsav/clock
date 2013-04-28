module Clock
  class Web < Padrino::Application
    register Padrino::Cache
    register Padrino::Helpers
    register Padrino::Rendering

    register BaristaInitializer
    register CompassInitializer

    enable :sessions

    enable :caching

    set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))

    configure :development do
      use BetterErrors::Middleware

      BetterErrors.application_root = PADRINO_ROOT
    end

    Pusher.app_id = ENV["PUSHER_ID"]
    Pusher.key = ENV["PUSHER_KEY"]
    Pusher.secret = ENV["PUSHER_SECRET"]
  end
end
