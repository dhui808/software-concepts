### Use Windows Subsystem for Linux
### Start Redis server
    sudo service redis-server restart
     
### Stop Redis server
    sudo service redis-server stop

### redis-cli
    127.0.0.1:6379>

### Connect to remote Redis database (Copy from Redis Cloud)
    redis-cli -u redis://<name>:<pwd>@redis-11111.c11.us-east-1-3.ec2.cloud.redislabs.com:11111

### Connect to remote Redis database (Copy from Redis Cloud) from Java client
    Spring application.properties
    redis.host=localhost
    redis.port=6379
    redis.password=

    @Bean
    public JedisConnectionFactory jedisConnectionFactory() {
        RedisStandaloneConfiguration redisConfig = new RedisStandaloneConfiguration();
        redisConfig.setHostName(redisHostName);
        redisConfig.setPort(redisPort);
        redisConfig.setPassword(redisPass);
        return new JedisConnectionFactory(redisConfig);
    }
    
