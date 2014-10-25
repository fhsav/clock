PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development' unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

CLOCK_VERSION = '0.4.10'

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

Bundler.require(:default, PADRINO_ENV)

if defined?(LogBuddy)
  LogBuddy.init({
    :logger   => logger,
    :disabled => PADRINO_ENV == :production
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
  ::RAILS_ENV = PADRINO_ENV unless defined?(::RAILS_ENV)
  Jammit.load_configuration(Padrino.root('.assets.yml'))
end

Padrino.load!
