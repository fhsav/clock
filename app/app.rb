module Clock
  class Web < Padrino::Application
    register Padrino::Cache
    register Padrino::Helpers
    register Padrino::Rendering
    register Padrino::Sprockets

    Faye::WebSocket.load_adapter('thin')

    use Faye::RackAdapter, :mount => '/faye', :timeout => 25

    asset_paths = [
      'assets/css',
      'assets/jsc',
      'assets/img',
      'assets/webfonts'
    ]

    sprockets :url => '_', :minify => (Padrino.env == :production), :paths => asset_paths

    enable :sessions

    enable :caching

    disable :protection

    set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))

    configure :development do
      use BetterErrors::Middleware

      BetterErrors.application_root = PADRINO_ROOT
    end
  end
end
