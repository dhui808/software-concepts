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
    
