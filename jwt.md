###  Examine JWT token
    https://jwt.io/
    To Examine your JWT token, copy request Authorization and remove Bearer, and inspect the token in jwt.io.
    
### Token based authentication
    Token based authentication works by ensuring that each request to a server is accompanied by a signed token which the 
    server verifies for authenticity and only then responds to the request.
    
### Opaque Access Tokens
    Opaque access tokens are tokens in a proprietary format that you cannot access and typically contain some identifier 
    to information in a server's persistent storage.  To validate an opaque token, the recipient of the token needs to 
    call the server that issued the token.

### JWT access tokens
    JSON Web Token (JWT) access tokens conform to the JWT standard and contain information about an entity in the form of 
    claims. They are self-contained therefore it is not necessary for the recipient to call a server to validate the token.
    
