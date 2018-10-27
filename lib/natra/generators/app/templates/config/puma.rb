threads_count = Integer(ENV['PUMA_MAX_THREADS'] || 5)
port          = Integer(ENV['PORT'] || 9292)

threads threads_count, threads_count
workers Integer(ENV['WEB_CONCURRENCY'] || 1)

preload_app!

environment ENV['RACK_ENV'] || 'development'

bind "tcp://0.0.0.0:#{port}"
