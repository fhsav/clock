require 'yaml'

PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)

require File.expand_path(File.dirname(__FILE__) + "/../config/boot.rb")
require File.expand_path(File.dirname(__FILE__) + "/factories.rb")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Capybara::DSL
  
  Capybara.app = Padrino.application
end

def app
  Padrino.application
end

def session
  last_request.env['rack.session']
end

def password
  directory = File.expand_path(File.dirname(__FILE__))

  config = YAML::load(File.open(File.join(directory, '..', '.fhsclock.yml')))
  
  config["password"]
end

def site
  "http://example.org"
end

def file
  f = File.join(File.dirname(__FILE__), 'wood.png')
  f = Rack::Test::UploadedFile.new(f, 'image/png')
  f
end

def response
  last_response
end

def element_visible?(element_id)
  # does the element exist?
  exists = page.has_css?(element_id)

  # is the element itself hidden with the .ui-helper-hidden class?
  self_hidden = page.has_css?("#{element_id}.ui-helper-hidden")

  # is the parent of the element hidden, thus hiding the element?
  parent_hidden = page.has_css?(".ui-helper-hidden > #{element_id}")

  # is the grandparent of the element, or any other ancestor, hidden?
  other_ancestor_hidden = page.has_css?(".ui-helper-hidden * #{element_id}")

  # if any of the above conditions are true, then the element is invisible
  invisible = self_hidden || parent_hidden || other_ancestor_hidden

  # the element is visible if it exists and it is not invisible
  return (exists && !invisible)
end

# When writing tests, you use the RSpec method (response). However,
# when you want to use Capybara, append :js => true to the end of a
# declaration of the test and use the Capybara method (page). If
# you're using Capybara, you'll also want to use visit "" instead
# of get "/" or whatever.
