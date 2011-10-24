# Unicorn configuration.

# Set some constants.
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)
PADRINO_ENV = 'production'

# Super-fast load times.
preload_app true

# Restart the worker if it hasn't responded in 30 seconds.
timeout 30

# Always use port 3000.
listen 3000

# Log to the correct files.
stderr_path PADRINO_ROOT + '/log/unicorn.error.log'
stdout_path PADRINO_ROOT + '/log/unicorn.log'

# PID file to the correct place.
pid PADRINO_ROOT + '/tmp/pids/unicorn.pid'
