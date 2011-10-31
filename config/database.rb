if ENV['HEROKU']
  MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com', 10015)
  MongoMapper.database = 'fhsclock'
  MongoMapper.database.authenticate('Timelord', 'cl*ck')
else
  logger = Logger.new(PADRINO_ROOT + "/log/mongodb.log")  
  
  MongoMapper.connection = Mongo::Connection.new('localhost', 27017, :logger => logger, :slave_ok => true)

  case Padrino.env
    when :development then MongoMapper.database = 'clock_development'
    when :production  then MongoMapper.database = 'clock_production'
    when :test        then MongoMapper.database = 'clock_test'
  end
  
  MongoMapper.logger
end

