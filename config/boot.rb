RACK_ENV     = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

CLOCK_VERSION = '0.4.12'

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

Bundler.require(:default, RACK_ENV)

if defined?(LogBuddy)
  LogBuddy.init({
    :logger   => logger,
    :disabled => RACK_ENV == :production
  })
end

if defined?(Dotenv)
  Dotenv.load!
end

def heroku?
  ENV['HEROKU']
end

Padrino.before_load do
  Padrino.require_dependencies(Padrino.root('app/uploaders/*.rb'))
end

Padrino.after_load do
  ::RAILS_ENV = RACK_ENV unless defined?(::RAILS_ENV)
  Jammit.load_configuration(Padrino.root('.assets.yml'))
end

Padrino.load!
