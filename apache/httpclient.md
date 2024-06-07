### org.apache.http.impl.client.HttpClientBuilder
    Following properties are ste by default, by retrieving from System.getProperty:
    http.keepAlive          true
    http.maxConnections     5
    
    defaultMaxPerRoute      = http.maxConnections
    maxTotal                = 2 * defaultMaxPerRoute

### Httpclient with Spring Resttemplate
    https://github.com/spring-framework-guru/sfg-blog-posts/tree/master/resttemplate
    poolingConnectionManager.setMaxPerRoute(new HttpRoute(localhost), MAX_LOCALHOST_CONNECTIONS);

### HttpClient not re-using connections
https://stackoverflow.com/questions/13034998/httpclient-is-not-re-using-my-connections-keeps-creating-new-ones  
disable connection state tracking.
