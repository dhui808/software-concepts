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
        
### Verify jwt token
    https://github.com/auth0/node-jsonwebtoken
    https://github.com/auth0/java-jwt
    https://github.com/auth0/jwks-rsa-java
    https://docs.pingidentity.com/r/en-us/pingdirectory-82/tnc1608139237101?tocId=ASdxu9LVo5PV9~siPrB2aw
    https://connect2id.com/products/nimbus-jose-jwt/examples/jwt-with-eddsa
    https://arnoldgalovics.com/spring-google-oauth/
    
    ChatGPT answer:
        const jwt = require('jsonwebtoken');

        const publicKey = 'your-public-key'; // retrieve the public key from a trusted source
        const token = req.headers.authorization.split(' ')[1]; // extract the JWT token from the Authorization header

        jwt.verify(token, publicKey, (err, decoded) => {
          if (err) {
            // the signature is not valid
            res.status(401).json({ error: 'Unauthorized' });
          } else {
            // the signature is valid
            req.user = decoded; // set the decoded payload as the user object in the request
            next();
          }
        });
