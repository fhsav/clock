require 'spork'

Spork.prefork do
  PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)

  require File.expand_path(File.dirname(__FILE__) + "/../config/boot.rb")

  FactoryGirl.find_definitions

  RSpec.configure do |conf|
    conf.include Rack::Test::Methods
    conf.include FactoryGirl::Syntax::Methods

    conf.before do
      
    end

    conf.after do
      MongoMapper.database.collections.each do |c|
        c.remove
      end
    end
  end

  def app
    Padrino.application
  end

  def file
    {
      :filename => "paris.jpg",
      :tempfile => Rack::Test::UploadedFile.new(File.join(File.dirname(__FILE__), 'fixtures', 'paris.jpg'), 'image/jpeg'),
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
