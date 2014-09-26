source 'https://rubygems.org'

ruby '2.1.3'

%w(core gen helpers cache).each do |g|
  gem 'padrino-' + g, '0.11.1'
end

gem 'thin'

gem 'rake'
gem 'sinatra-flash', :require => "sinatra/flash"


gem 'mongoid'
gem 'mongoid-grid_fs'

gem 'carrierwave', :require => 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'

gem 'memcachier'
gem 'dalli'

gem 'tzinfo'

gem 'ohm'

gem 'pusher'

gem 'tilt', '~> 1.3.7'

gem 'haml'

gem 'jammit-sinatra'

gem 'compass', '~> 0.12.7'
gem 'susy'

gem 'barista'

gem 'uglifier'
gem 'yui-compressor'
gem 'closure'

gem 'protected_attributes'

group :production do
  gem 'sentry-raven'
end

group :development do
  gem 'foreman'
  gem 'therubyracer'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'pry'

  gem 'rubocop'
end

group :development, :test do
  gem 'log_buddy'
  gem 'dotenv'
end

group :test do
  gem 'rack-test', :require => 'rack/test'

  gem 'rspec'
  gem 'shoulda-matchers'

  gem 'spork'
  gem 'factory_girl'
  gem 'database_cleaner'
end
