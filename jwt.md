###  Examine JWT token
    https://jwt.io/
    To Examine your JWT token, copy request Authorization and remove Bearer, and inspect the token in jwt.io.
    
### Token based authentication
    Token based authentication works by ensuring that each request to a server is accompanied by a signed token which the 
    server verifies for authenticity and only then responds to the request.
    
### Opaque Access Tokens
    The opaque token is a random unique string of characters issued by the authorization server. It is one of the possible 
    formats that access tokens or refresh tokens can take. The opaque token does not pass any identifiable information on 
    the user so it’s impossible for the resource server to make any authorization decisions based on the opaque token itself. 
    The opaque contains an identifier to information stored on the authorization server. To validate the token and retrieve 
    the information on the token and the user, the resource server calls the authorization server and requests the token 
    introspection.

### JWT access tokens
    JSON Web Token (JWT) access tokens conform to the JWT standard and contain information about an entity in the form of 
    claims. They are self-contained therefore it is not necessary for the recipient to call a server to validate the token.
    
### ID Token vs Access Token
    auth0.com/blog/id-token-access-token-what-is-the-difference/
    
    ID token:
        The user has been authenticated.
        Spec: OpenID Connect
        Format: JWT
        Payload: holds identification info)
        Usage: assume the user is suthenticated; get user profile data
        Don't: call API; check if the user is allowed to access sth.
        
    Access Token
        The app has been authorized.
        Spec: OAuth
        Format: any structure, including JWT
        Payload (JWT): holds authorization info
        Usage: call API; check if the user is allowed to access sth; inspect its content on the server side
        Don't: inspect its content on the client side
        