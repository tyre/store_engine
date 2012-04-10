path_to_app = "/home/chris/Rails_Apps/"
working_directory "#{path_to_app}store_engine/"
pid "#{path_to_app}/store_engine/tmp/pids/unicorn.pid"
stderr_path "#{path_to_app}/store_engine/log/unicorn.log"
stdout_path "#{path_to_app}/store_engine/log/unicorn.log"

listen "/tmp/unicorn.todo.sock"
worker_processes 2
timeout 30