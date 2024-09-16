require 'redis'

begin
  redis_url = ENV.fetch("REDIS_URL") # Ensure REDIS_URL is provided
  redis_config = { url: redis_url }
  $redis = Redis.new(redis_config)
rescue KeyError => e
  puts "REDIS_URL is not set: #{e}"
rescue Exception => e
  puts "Redis connection error: #{e}"
end

begin
  redis_lock_url = ENV.fetch("REDIS_URL")
  $redis_lock = Redlock::Client.new([redis_lock_url])
rescue KeyError => e
  puts "REDIS_URL for Redlock is not set: #{e}"
rescue Exception => e
  puts "Redlock initialization error: #{e}"
end
