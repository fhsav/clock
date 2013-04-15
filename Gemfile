source 'https://rubygems.org'

%w(core gen helpers cache).each do |g|
  gem 'padrino-' + g, '0.11.1'
end

gem 'thin'

gem 'rake'
gem 'sinatra-flash', :require => "sinatra/flash"

gem 'dotenv'

gem 'bson_ext'
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
