## Client Authentication Methods
Share secret based

    client_secret_basic (Default: HTTP Basic authentication, RFC 6749 (Section 2.3.1))
    client_secret_post (Client secret in the POST body, RFC 6749 (Section 2.3.1))
    client_secret_jwt (RFC 6749)

Private key based

    private_key_jwt (Asymmetric key authentication) (RFC 7521, RFC 7523)
    tls_client_auth (using certificate) (RFC 8705)
    self_signed_tls_client_auth


Example:
openapi: 3.0.3
info:
  title: Order Management and OAuth2 API
  version: 1.0.0
paths:
  /api/search:
    get:
      summary: Search orders
      description: |
        Searches orders. This endpoint supports multiple authentication methods:
        HMAC signatures, or OAuth2 Bearer tokens returned from the `/oauth2/token` endpoint.
      security:
        - HMAC_SHA1: []
        - HMAC_SHA512: []
        - OAUTH2_BASIC: []
        - OAUTH2_JWT: []
      responses:
        '200':
          description: Successful response
        '401':
          description: Unauthorized
          
  /oauth2/token:
    post:
      summary: Request OAuth2 access token
      description: |
        Endpoint to obtain an OAuth2 access token using either 
        `client_secret_post` or `private_key_jwt`.
      requestBody:
        required: true
        content:
          application/x-www-form-urlencoded:
            schema:
              type: object
              properties:
                grant_type:
                  type: string
                client_id:
                  type: string
                client_secret:
                  type: string
                client_assertion_type:
                  type: string
                  enum: [urn:ietf:params:oauth:client-assertion-type:jwt-bearer]
                client_assertion:
                  type: string
                  description: The signed JWT assertion
      security:
        - OAuth2_ClientSecretPost: []
        - OAuth2_PrivateKeyJWT: []
      responses:
        '200':
          description: Token response containing the access_token
        '400':
          description: Invalid request or invalid client credentials

components:
  securitySchemes:
    # --- New OAuth2 Bearer Schemes for /api/search ---
    OAUTH2_BASIC:
      type: http
      scheme: bearer
      bearerFormat: Opaque
      description: |
        An opaque, basic access token obtained from `/oauth2/token`.
        Pass this in the header as: `Authorization: Bearer <access_token>`

    OAUTH2_JWT:
      type: http
      scheme: bearer
      bearerFormat: JWT
      description: |
        A JSON Web Token (JWT) access token obtained from `/oauth2/token`.
        Pass this in the header as: `Authorization: Bearer <access_token>`

    # --- HMAC Schemes for /api/search ---
    HMAC_SHA1:
      type: apiKey
      in: header
      name: Authorization
      description: |
        HMAC-SHA1 signature. Format: `Authorization: HMAC-SHA1 <signature>`
    
    HMAC_SHA512:
      type: apiKey
      in: header
      name: Authorization
      description: |
        HMAC-SHA512 signature. Format: `Authorization: HMAC-SHA512 <signature>`

    # --- OAuth2 Client Authentication Schemes for /oauth2/token ---
    OAuth2_ClientSecretPost:
      type: apiKey
      in: x-custom-form-body
      name: client_secret
      description: Credentials passed inside the application/x-www-form-urlencoded body.
      
    OAuth2_PrivateKeyJWT:
      type: apiKey
      in: x-custom-form-body
      name: client_assertion
      description: Client asserts identity via a signed JWT (`client_assertion`) inside the form body.
