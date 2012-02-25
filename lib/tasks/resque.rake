require 'resque/tasks'

namespace :resque do
  desc "Load the application development for Resque."
  task :setup => :environment do
    ENV['QUEUES'] = '*'
    # ENV['VERBOSE']  = '1' # Verbose Logging
    # ENV['VVERBOSE'] = '1' # Very Verbose Logging
  end
end
