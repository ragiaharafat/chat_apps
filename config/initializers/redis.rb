require 'redis'
require 'redlock'

# Default Redis URL
default_redis_url = "redis://localhost:6379"

# Initialize Redis client
redis_url = ENV.fetch("REDIS_URL", default_redis_url)
begin
  $redis = Redis.new(url: redis_url)
rescue Exception => e
  puts "Redis client error: #{e.message}"
end

# Initialize Redlock client
redis_lock_url = ENV.fetch("REDIS_URL", default_redis_url + "/1")
begin
  $redis_lock = Redlock::Client.new([redis_lock_url])
rescue Exception => e
  puts "Redlock client error: #{e.message}"
end
