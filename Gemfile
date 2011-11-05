source :rubygems

group :development do
  gem 'thin'
end

group :test do
  gem 'rspec', :group => "test"
  gem 'rack-test', :require => "rack/test", :group => "test"
end

group :production do
  gem 'unicorn'
  gem 'cijoe', '0.9.1', :path => "vendor/gems/cijoe-0.9.1"
end

gem 'rake'
gem 'rack-flash'
gem 'rack-protection'

gem 'bson_ext', '1.4.0', :require => "mongo"
gem 'mongo_mapper'
gem 'joint'

gem 'haml'
gem 'compass'
gem 'barista'
gem 'maruku'


gem 'padrino', '0.10.0'
