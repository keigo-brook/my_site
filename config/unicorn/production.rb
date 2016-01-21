# paths
app_path = '/var/www/my_site'
shared_path = "/var/www/my_site/shared/"
current_path = "/var/www/my_site/current"
pid "#{app_path}/current/tmp/pids/unicorn.pid"

listen File.expand_path('tmp/sockets/unicorn.sock', shared_path)
pid File.expand_path('tmp/pids/unicorn.pid', shared_path)

working_directory current_path

stderr_path "#{app_path}/current/log/unicorn.log"
stdout_path "#{app_path}/current/log/unicorn.log"



worker_processes 2
timeout 30
preload_app true

before_exec do |worker|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('Gemfile', current_path)
end

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"

  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
  sleep 1
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end