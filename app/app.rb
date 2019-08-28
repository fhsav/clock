module Clock
  class Web < Padrino::Application
    register Padrino::Cache
    register Padrino::Helpers
    register Padrino::Rendering
    register Jammit

    enable :sessions
    disable :protection


    configure :development, :test do
      set :cache, Padrino::Cache.new(:Memcached, :backend => ::Dalli::Client.new('127.0.0.1:11211'), :exception_retry_limit => 1)
    end

    configure :production do
      set :cache, Padrino::Cache.new(:Memcached, :backend => ::Dalli::Client.new(ENV["MEMCACHED_HOST"]));

      Pusher.app_id = ENV["PUSHER_ID"]
      Pusher.key =    ENV["PUSHER_KEY"]
      Pusher.secret = ENV["PUSHER_SECRET"]

      use Raven::Rack
    end

    configure :development do
      register BaristaInitializer
      register CompassInitializer

      use BetterErrors::Middleware

      BetterErrors.application_root = PADRINO_ROOT

      Pusher.app_id = ENV["PUSHER_ID"]
      Pusher.key =    ENV["PUSHER_KEY"]
      Pusher.secret = ENV["PUSHER_SECRET"]
    end

    configure :production do
      enable :caching
    end
  end
end
