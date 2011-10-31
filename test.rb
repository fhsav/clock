require 'rubygems'
require 'sinatra'

gem 'jnunemaker-rack-gridfs'
require 'rack/gridfs'

use Rack::GridFS, :hostname => 'localhost', :port => 27017, :database => 'testing', :prefix => 'gridfs', :slave_ok => true

db = Mongo::Connection.new('localhost', 27017, :slave_ok => true).db('testing')
id = Mongo::Grid.new(db).put(File.read('public/img/background2.jpg'), 'background2.jpg')

get '/' do
  " #{id} "
end
