worker_processes 2
stderr_path "log/unicorn.error.log"
stdout_path "log/unicorn.log"

listen "/home/apps/rails-101/shared/tmp/unicorn.sock"
pid "tmp/pids/unicorn.pid"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
