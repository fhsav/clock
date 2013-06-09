source 'https://rubygems.org'

%w(core gen helpers cache).each do |g|
  gem 'padrino-' + g, '0.11.1'
end

gem 'thin'

gem 'rake'
gem 'sinatra-flash', :require => "sinatra/flash"

gem 'dotenv'

gem 'mongoid'
gem 'mongoid-grid_fs'

gem 'carrierwave', :require => 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'

gem 'memcached'

gem 'tzinfo'

gem 'ohm'

gem 'faye'

gem 'bcrypt-ruby'

gem 'tilt', '~> 1.3.7'

gem 'haml'

gem 'jammit-sinatra'

gem 'compass'
gem 'susy'

gem 'barista'

gem 'uglifier'
gem 'yui-compressor'
gem 'closure'

group :development do
  gem 'foreman'
  gem 'therubyracer'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'log_buddy'

  gem 'pry'

  gem 'rubocop'
end

group :test do
  gem 'rack-test', :require => 'rack/test'

  gem 'rspec'
  gem 'shoulda-matchers'

  gem 'spork'
  gem 'factory_girl'
  gem 'database_cleaner'
end

group :production do
  gem 'cijoe', :git => 'https://github.com/nvloff/cijoe.git'
end
