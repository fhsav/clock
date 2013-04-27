PADRINO_ENV  = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development" unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

COMMIT = `git show --pretty=%H`.split[0...1].join(' ')
BRANCH = `git rev-parse --abbrev-ref HEAD`

CLOCK_VERSION = '0.5.0b'

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

Bundler.require(:default, PADRINO_ENV)

unless PADRINO_ENV == :test
  Dotenv.load
end

def heroku?
  ENV["HEROKU"]
end

Padrino.load!
