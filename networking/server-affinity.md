### The primary mechanisms for achieving server affinity (sticky sessions)
    ChatGPT:
    IP Address Hashing:
    The load balancer uses the client's IP address to create a hash. This hash determines which backend server will handle the 
    client's requests. As long as the client's IP address remains the same, the hash will consistently map to the same server.
    
    Session Cookies:
    The load balancer can insert a special cookie into the client's response. This cookie contains information that the load 
    balancer uses to route subsequent requests from the same client to the same server. The cookie might include a server 
    identifier or session-specific data.
    
    URL Path Hashing:
    Some load balancers can use the URL path to create a hash, ensuring that requests with the same path pattern are directed 
    to the same server. This method is less common for general server affinity but can be useful in specific scenarios.
    
    Application Layer Data:
    The load balancer can use data from the application layer, such as a session ID embedded in the request, to determine the 
    appropriate backend server. This requires cooperation between the application and the load balancer.
    
    Custom Headers:
    Custom headers can be used where the application sets a header that the load balancer recognizes and uses to route the 
    request to the correct server.

    Copilot
    IP Hashing: This method uses a hash function on the client’s IP address to determine which server will handle the request. 
    It ensures that requests from the same client are directed to the same server, as long as the server set remains unchanged.
    
    Sticky Sessions: Also known as session persistence, this method uses cookies or URL rewriting to track the client’s session 
    and direct subsequent requests to the same server that handled the initial request.
    
