require 'yaml'

PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)

require File.expand_path(File.dirname(__FILE__) + "/../config/boot.rb")
require File.expand_path(File.dirname(__FILE__) + "/factories.rb")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  Padrino.application
end

def session
  last_request.env['rack.session']
end

def password
  directory = File.expand_path(File.dirname(__FILE__))

  config = YAML::load(File.open(File.join(directory, '..', '.fhsclock.yml')))
  
  config["password"]
end

def site
  "http://example.org"
end

def file
  f = File.join(File.dirname(__FILE__), 'wood.png')
  f = Rack::Test::UploadedFile.new(f, 'image/png')
  f
end

def response
  last_response
end
