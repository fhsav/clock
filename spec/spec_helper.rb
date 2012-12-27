require 'spork'
require 'fog'

Spork.prefork do
  PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
  
  ENV["S3_ID"] = "id"
  ENV["S3_SECRET"] = "secret"

  Fog.mock!

  require File.expand_path(File.dirname(__FILE__) + "/../config/boot.rb")

  FactoryGirl.find_definitions

  RSpec.configure do |conf|
    conf.include Rack::Test::Methods
    conf.include FactoryGirl::Syntax::Methods

    conf.before :suite do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
    end

    conf.before do
      DatabaseCleaner.start
    end

    conf.after do
      DatabaseCleaner.clean
    end
  end

  def app
    Padrino.application
  end

  def file
    {
      :filename => "paris.jpg",
      :tempfile => Tempfile.new(File.join(File.dirname(__FILE__), 'fixtures', 'paris.jpg')),
      :type => "image/jpeg"
    }
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
