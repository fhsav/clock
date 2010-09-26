### Clock.
###   file: app/clock.rb

### Configure the application.
directory = File.expand_path(File.dirname(__FILE__))

configure do
  # Setup the database.
  #DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/database.db")
  DataMapper.setup(:default, 'sqlite::memory:')

  # Make a struct.
  Clock = OpenStruct.new(
    :time => DateTime.now
  )
  
  # Set paths.
  set :views, Dir.pwd + '/app/views'
  
  # Set options.
  set :environment, :development
end

### Load the helpers.
load File.join(directory, 'helpers', 'helpers.rb')

### Load the models.
load File.join(directory, 'models', 'marquee.rb')
load File.join(directory, 'models', 'schedule.rb')
DataMapper.auto_upgrade!

### Load the controllers.
load File.join(directory, 'controllers', 'api.rb')
load File.join(directory, 'controllers', 'admin.rb')
load File.join(directory, 'controllers', 'public.rb')
