require 'yaml'

directory = File.expand_path(File.dirname(__FILE__))
yaml = YAML::load(File.open(File.join(directory, '..', 'config', 'settings.yml')))

if yaml["password"]
  puts yaml["password"]
end
