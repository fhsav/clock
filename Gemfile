source :rubygems

# Server requirements
# gem 'thin' or mongrel
gem 'thin'

group :production do
  gem 'passenger'
  gem 'god'
  gem 'cijoe'
end

# Project requirements
gem 'rake'
gem 'rack-flash'
gem 'redis'

# Component requirements
gem 'haml'
gem 'barista'
gem 'compass'
gem 'mongo_mapper'
gem 'bson_ext', :require => "mongo"
gem 'maruku'
gem 'ya2yaml'
gem 'pony'

# Test requirements
gem 'rspec', :group => "test"
gem 'rack-test', :require => "rack/test", :group => "test"

# Padrino
gem 'padrino', '0.10.0'
# Padrino EDGE
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'
#
# Individual GEMS
# gem 'padrino-core', '0.10.0'
# gem 'padrino-admin', '0.10.0'
# gem 'padrino-cache', '0.10.0'
# gem 'padrino-core', '0.10.0'
# gem 'padrino-gen', '0.10.0'
# gem 'padrino-helpers', '0.10.0'
# gem 'padrino-mailer', '0.10.0'
