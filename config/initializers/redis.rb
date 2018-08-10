$redis = Redis.new(
	url: ENV.fetch("REDIS_URL", "redis://localhost:6379"),
)
Redis.current = $redis
Resque.redis = $redis