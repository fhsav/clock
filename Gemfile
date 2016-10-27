source 'https://rubygems.org'

# Get Ruby version from .ruby-version
ruby File.read(".ruby-version").strip

gem 'padrino-core'
gem 'padrino-gen'
gem 'padrino-helpers'
gem 'padrino-cache'

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

gem 'tilt'

gem 'haml'

gem 'jammit-sinatra'

gem 'compass'
gem 'susy'

gem 'barista'

gem 'uglifier'
gem 'yui-compressor'
gem 'closure'

gem 'protected_attributes'

gem 'dotenv'

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
end

group :test do
  gem 'rack-test', :require => 'rack/test'

  gem 'rspec'
  gem 'shoulda-matchers'

  gem 'spork'
  gem 'factory_girl'
  gem 'database_cleaner'
end
