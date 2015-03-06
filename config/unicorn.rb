worker_processes 2
stderr_path "log/unicorn.error.log"
stdout_path "log/unicorn.log"

listen "/home/apps/rails-101/shared/tmp/unicorn.sock"
pid "tmp/pids/unicorn.pid"
