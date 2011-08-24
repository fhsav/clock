PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  Padrino.application
end

def session
  last_request.env['rack.session']
end

@@yaml = YAML::load(File.open(PADRINO_ROOT + '/spec/private.yml'))
