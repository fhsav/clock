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

gem 'memcached'

gem 'mutations'

gem 'girl_friday'

gem 'tzinfo'

gem 'ohm'

gem 'faye'

gem 'bcrypt-ruby'

gem 'tilt', '~> 1.3.7'

gem 'haml'

gem 'padrino-sprockets', git: 'https://github.com/eturk/padrino-sprockets.git', require: 'padrino/sprockets'

gem 'sprockets-sass'
gem 'compass'
gem 'susy'

gem 'coffee-script'

gem 'uglifier'
gem 'yui-compressor'

group :development do
  gem 'foreman'
  gem 'therubyracer'

  gem 'better_errors'
  gem 'binding_of_caller'

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
