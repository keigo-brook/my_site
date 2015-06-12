# paths
app_path = 'var/www/my_site'
working_directory "#{app_path}/current"
pid "#{app_path}/current/tmp/pids/unicorn.pid"

# listen
listen "#{app_path}/current/tmp/unicorn.sock", backlog: 64

stderr_path "#{app_path}/current/log/unicorn.log"
stdout_path "#{app_path}/current/log/unicorn.log"

worker_processes Integer(ENV['WEB_CONCURRENCY'])
timeout 30
preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  
end