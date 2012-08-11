require 'spork'

Spork.prefork do
  PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)

  require File.expand_path(File.dirname(__FILE__) + "/../config/boot.rb")

  RSpec.configure do |conf|
    conf.include Rack::Test::Methods
  end

  def app
    Padrino.application
  end

  def file
    Rack::Test::UploadedFile.new(File.join(File.dirname(__FILE__), 'fixtures', 'paris.jpg'), 'image/jpeg')
  end

  def response
    last_response
  end

  def session
    last_request.env['rack.session']
  end

  def site
    "http://example.org"
  end
end

Spork.each_run do
  # Things that need to run every time...
end
