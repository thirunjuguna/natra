require "yaml"

# Redis Configuration
unless ENV['SINATRA_ENV'] == 'test'
  redis_settings = YAML::load_file("config/redis.yml")
  REDIS = Redis.new(redis_settings[ENV['SINATRA_ENV']])
end
