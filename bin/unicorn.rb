PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)
PADRINO_ENV = 'production'

preload_app true
timeout 30
listen 3000

stderr_path PADRINO_ROOT + '/log/unicorn.error.log'
stdout_path PADRINO_ROOT + '/log/unicorn.log'

pid PADRINO_ROOT + '/tmp/pids/unicorn.pid'
