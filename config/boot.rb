PADRINO_ENV  = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development" unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)
CLOCK_VERSION = "0.2.9"

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

Bundler.require(:default, PADRINO_ENV)

unless ENV["HEROKU"]
  TZ = ActiveSupport::TimeZone.new("Eastern Time (US & Canada)")
end

Padrino.load!
