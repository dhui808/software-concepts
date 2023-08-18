### Authentication
	OpenID Connect
### Authorization
	OAuth 2.0

[ID token vs Access token](https://auth0.com/blog/id-token-access-token-what-is-the-difference/)

### ID Token - OpenID Connect
	An ID token is an artifact that proves that the user has been authenticated.
	An ID token is encoded as a JSON Web Token (JWT).
	ID token is signed by the issuer with its private key. 
 	JSON properties in JWT are called claims
  		aud claim. The audience of the token, i.e., the Client ID of the web application that is meant to be the 
		final recipient of the token.
	
### Access Token
	The access token is the artifact that allows the client application to access the user's resource.
 	Scopes are a mechanism that allows the user to authorize a third-party application to perform only specific operations.
      
