PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

set :output, PADRINO_ROOT + '/log/cron.log'

every 1.day, :at => "12:00 am" do
  command "/var/www/fhsclock/script/production/update"
end
