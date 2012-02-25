env = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development"
resque = YAML.load_file Padrino.root('.resque.yml')
Resque.redis = resque[env]
