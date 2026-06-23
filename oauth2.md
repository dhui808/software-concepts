## Client Authentication Methods
Share secret based

    client_secret_basic (Default: HTTP Basic authentication, RFC 6749 (Section 2.3.1))
    client_secret_post (Client secret in the POST body, RFC 6749 (Section 2.3.1))
    client_secret_jwt (RFC 6749)

Private key based

    private_key_jwt (Asymmetric key authentication) (RFC 7521, RFC 7523)
    tls_client_auth (using certificate) (RFC 8705)
    self_signed_tls_client_auth

