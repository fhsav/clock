PADRINO_ROOT = File.expand_path('..', __FILE__) unless defined?(PADRINO_ROOT)

God::Contacts::Email.defaults do |d|
  d.from_email = "fhsclock@gmail.com"
  d.from_name = "God"
  d.delivery_method = :smtp
  d.server_host = "smtp.gmail.com"
  d.server_port = 465
  d.server_auth = true
  d.server_domain = "smtp.gmail.com"
  d.server_user = "fhsclock@gmail.com"
  d.server_password = "shrug#cl*ck"
end

God.contact(:email) do |c|
  c.name = "Ethan Turkeltaub"
  c.group = "developers"
  c.to_email = "ethan.turkeltaub@gmail.com"
end

God.contact(:email) do |c|
  c.name = "Evan Foreman"
  c.group = "consumers"
  c.to_email = "fhsav@comcast.net"
end

%w{3000}.each do |port|
  God.watch do |w|
    w.name = "fhsclock-passenger-#{port}"
    w.interval = 30.seconds
    w.start = "passenger start -d"
    w.stop = "passenger stop"
    w.restart = "passenger stop \ passenger start -d"
    w.start_grace = 20.seconds
    w.restart_grace = 30.seconds
    w.pid_file = File.join(PADRINO_ROOT, "tmp", "pids", "passenger.#{port}.pid.lock")
    
    w.behavior(:clean_pid_file)
    
    w.start_if do |start|
      start.condition(:process_running) do |c|
        c.interval = 5.seconds
        c.running = false
      end
    end
    
    w.restart_if do |restart|
    end
    
    w.transition(:up, :start) do |on|
      on.condition(:process_exits) do |c|
        c.notify = {:contacts => ["Ethan Turkeltaub", "Evan Foreman"], :priority => 1}
      end
    end
    
    w.lifecycle do |on|
      on.condition(:flapping) do |c|
        c.to_state = [:start, :restart]
        c.times = 5
        c.within = 5.minute
        c.transition = :unmonitored
        c.retry_in = 10.minutes
        c.retry_times = 5
        c.retry_within = 2.hours
      end
    end
  end
end