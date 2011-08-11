logger = Logger.new(PADRINO_ROOT + "/log/mongodb.log")

MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'clock_development'
  when :production  then MongoMapper.database = 'clock_production'
  when :test        then MongoMapper.database = 'clock_test'
end

MongoMapper.logger
