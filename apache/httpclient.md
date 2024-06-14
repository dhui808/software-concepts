### org.apache.http.impl.client.HttpClientBuilder
    Following properties are ste by default, by retrieving from System.getProperty:
    http.keepAlive          true
    http.maxConnections     5
    
    defaultMaxPerRoute      = http.maxConnections
    maxTotal                = 2 * defaultMaxPerRoute

### Httpclient with Spring Resttemplate
    https://github.com/spring-framework-guru/sfg-blog-posts/tree/master/resttemplate
    poolingConnectionManager.setMaxPerRoute(new HttpRoute(localhost), MAX_LOCALHOST_CONNECTIONS);

### HttpClient not re-using connection
https://stackoverflow.com/questions/13034998/httpclient-is-not-re-using-my-connections-keeps-creating-new-ones  
disable connection state tracking.

### How to release HttpClient connection?
https://stackoverflow.com/questions/4775618/httpclient-4-0-1-how-to-release-connection  
don't forget to consume the entity even if you didn't open its content.  
consumeContent() is now (4.1.2) deprecated. A one liner instead: EntityUtils.consume(response.getEntity());  
if you don't consume the entity, the HttpClient will consider the request as still in progress.  
Note: This solution makes more sense.  

### HttpClient Doc
    7.2. Stateful HTTP connections
    While HTTP specification assumes that session state information is always embedded in HTTP messages in the form 
    of HTTP cookies and therefore HTTP connections are always stateless, this assumption does not always hold true 
    in real life. There are cases when HTTP connections are created with a particular user identity or within a 
    particular security context and therefore cannot be shared with other users and can be reused by the same user 
    only. Examples of such stateful HTTP connections are NTLM authenticated connections and SSL connections with 
    client certificate authentication.

    7.2.1. User token handler
    HttpClient relies on UserTokenHandler interface to determine if the given execution context is user specific or 
    not. The token object returned by this handler is expected to uniquely identify the current user if the context 
    is user specific or to be null if the context does not contain any resources or details specific to the current 
    user. The user token will be used to ensure that user specific resources will not be shared with or reused by 
    other users.

### HttpClient Connection Configuration 
    https://stackoverflow.com/questions/54515235/apache-httpclient-connection-configuration
    Use header Connection: Close (instead of Keep-Alive)
### When using Apache HttpClient, whether to add the request header "Connection: Close" or "Connection: Keep-Alive"

    Connection: Keep-Alive
    Persistent Connection: By default, HTTP/1.1 uses persistent connections, allowing multiple requests and responses 
    to be sent over a single TCP connection without reopening it each time. This is more efficient and can significantly 
    reduce latency for subsequent requests.
    Efficiency: Useful for applications that send multiple requests to the same server, as it reduces the overhead of 
    establishing new connections.
    Resource Management: Requires proper management to ensure that connections are properly closed when no longer needed, 
    to avoid resource leakage.
    
    Connection: Close
    Non-Persistent Connection: Instructs the server to close the TCP connection after the response is sent. This can be 
    useful in scenarios where you know that you will not need to reuse the connection.
    Resource Release: Ensures that connections are immediately closed and resources are freed up, which can be beneficial 
    in some cases to avoid potential resource exhaustion.
    Simplicity: Simplifies connection management, especially in environments where managing connection pooling is complex 
    or unnecessary.
    
    Recommendations
    Default Behavior: If you don’t specify the "Connection" header, HttpClient will use the default behavior of HTTP/1.1, 
    which is to keep the connection alive.
    Use Keep-Alive: For most use cases, especially when making multiple requests to the same server, using 
    "Connection: Keep-Alive" is recommended to benefit from reduced latency and improved performance.
    Use Close When Necessary: Use "Connection: Close" if your application does not need to reuse connections, or in 
    environments where resource management is a concern and you want to ensure that connections are promptly closed.
