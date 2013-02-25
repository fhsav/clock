PADRINO_ENV  = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development" unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

CLOCK_VERSION = "0.4.4 beta"

COMMIT = `git show --pretty=%H`.split[0...1].join(' ')

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

Bundler.require(:default, PADRINO_ENV)

unless PADRINO_ENV == :test
  Dotenv.load
end

LogBuddy.init({
  :logger => logger,
  :disabled => ENV["HEROKU"] || PADRINO_ENV == :production
})

def heroku?
  ENV["HEROKU"]
end

Padrino.load!
