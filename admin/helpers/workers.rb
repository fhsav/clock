class Refresh
  @queue = :refresh
  
  def self.perform
    yaml = YAML::load(File.open(File.join(PADRINO_ROOT, '.fhsclock.yml')))["pusher"]
    
    Pusher.app_id = yaml["id"]
    Pusher.key = yaml["key"]
    Pusher.secret = yaml["secret"]
    
    Pusher["refreshes"].trigger!("refresh", { :timestamp => Time.now })
  end
end
