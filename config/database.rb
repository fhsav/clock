MongoMapper.setup(YAML::load(File.open(Padrino.root(".mongo.yml"))), PADRINO_ENV, :logger => nil)
