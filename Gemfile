source :rubygems

ruby '1.9.3'

%w{admin cache core gen helpers}.each do |p|
  gem "padrino-#{p}", '0.10.7'
end

gem 'thin'

gem 'rake'
gem 'sinatra-flash', :require => "sinatra/flash"

gem 'dotenv'

gem 'bson_ext', :require => "mongo"
gem 'mongo_mapper'

gem 'fog'

gem 'girl_friday'

gem 'tzinfo'

gem 'ohm'

gem 'pusher'

gem 'bcrypt-ruby'

gem 'haml'

gem 'sass'
gem 'compass'
gem 'susy'

gem 'barista'

group :development do
  gem 'foreman'
  gem 'therubyracer'
end

group :test do
  gem 'rack-test', :require => "rack/test"
  gem 'spork'
  gem 'rspec'
  gem 'factory_girl'
end

group :production do
  gem 'cijoe', :git => "https://github.com/nvloff/cijoe.git"
end
