worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 28
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  # Disconnect ActiveRecord
  if defined?(Sequel::Model.db)
    Sequel::Model.db.disconnect
    puts 'Unicorn before_fork: Disconnected Sequel'
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  # Note: Sequel reconnects to the database as needed
  # see http://sequel.jeremyevans.net/rdoc/files/doc/code_order_rdoc.html
end
