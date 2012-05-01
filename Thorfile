class Default < Thor
  desc "start", "Start the clock."
  def start
    `./bin/start`
  end
  
  desc "stop", "Stop the clock."
  def stop
    `./bin/stop`
  end
  
  desc "server", "Start a development server."
  def server
    `bundle exec padrino start -a thin -p 8080`
  end
  
  desc "safe", "Start the clock after running tests."
  def safe
    `./bin/safe`
  end
end