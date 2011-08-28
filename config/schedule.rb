require 'boot.rb'

set :output, PADRINO_ROOT + '/log/cron.log'

every 1.day, :at => "12:00 am" do
  command "/var/www/fhsclock/script/production/update"
end
