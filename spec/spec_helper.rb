require 'spork'
require 'fog'

Spork.prefork do
  PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)

  ENV['S3_ID'] = 'id'
  ENV['S3_SECRET'] = 'secret'
  ENV['S3_BUCKET'] = 'foobar'

  Fog.mock!

  require File.expand_path(File.dirname(__FILE__) + '/../config/boot.rb')

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
      :filename => 'paris.jpg',
      :tempfile => Tempfile.new(File.join(File.dirname(__FILE__), 'fixtures', 'paris.jpg')),
      :type => 'image/jpeg'
    }
  end

  def response
    last_response
  end

  def session
    last_request.env['rack.session']
  end

  def site
    'http://example.org'
  end
end

Spork.each_run do
  # Things that need to run every time...
end
