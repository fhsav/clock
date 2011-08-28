PADRINO_ENV  = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development"  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)
CLOCK_VERSION = "0.1.2"

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)

require 'yaml'

@@yaml = YAML::load(File.open(File.join(PADRINO_ROOT, 'config', 'settings.yml')))

Padrino.load!
