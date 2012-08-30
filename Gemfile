source :rubygems

gem 'thin'

gem 'foreman'

gem 'rake'
gem 'sinatra-flash', :require => "sinatra/flash"

gem 'bson_ext', :require => "mongo"
gem 'mongo_mapper'

gem 'rack-gridfs', :require => "rack/gridfs"
gem 'joint'

gem 'pusher'

gem 'rdiscount'
gem 'haml'

gem 'sass'
gem 'compass'
gem 'susy'

gem 'barista'

gem 'tzinfo'
gem 'htmlentities'

gem 'padrino', '0.10.7'

group :test do
  gem 'rack-test', :require => "rack/test"
  gem 'rspec'
end

group :development do
  gem 'therubyracer' # Heroku does not require therubyracer.
end

group :production do
  gem 'cijoe', :git => "https://github.com/nvloff/cijoe.git"
end