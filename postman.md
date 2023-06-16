### Access current environment variable values in the Pre-request and Tests code.
    pm.environment.get("variable_key");

### Setting environment variables from scripts
    The Pre-request and Tests scripts can update environment variable values.
    pm.environment.set("variable_key", "variable_value");
    
### Set global environment variables with test scripts
    Tests scripts execute after the response is received.
    Test scripts are JavaScript
    
    pm.test("Status test", function () {
        pm.globals.set("oauth_token", pm.response.json().access_token);
        pm.globals.unset("oauth_token_test");
    });

### Get Google OAuth access token from postman
    Go to Google Cloud console
    API & Services -> Oauth consent screen
    EDIT APP
    Under Authorized domains, ADD DOMAIN -> getpostman.com
    SAVE and CONTINUE -> ADD OR REMOVE SCOPES -> Select openid -> UPDATE
    SAVE and CONTINUE -> (Test users) ADD USERS (While publishing status is set to "Testing",
    only test users are able to access the app.)
    SAVE and CONTINUE
    
    API & Services -> Credentials
    ADD/Edit Credentials
    Under Authorized redirect URIs, ADD URI -> https://www.getpostman.com/oauth2/callback
    SAVE
    
    In Postman Worspaces, create a collection.
    Under Authorization tab, Configure New Token
        Grant Type: 'Authorization Code'
        Callback URL: https://www.getpostman.com/oauth2/callback
        Auth URL: https://accounts.google.com/o/oauth2/auth
        Access Token URL: https://accounts.google.com/o/oauth2/token
        Client ID:
        Client Secret:
        Scope: 
        Client Authentication: "Send as Basic Auth header"
        Get New Access Token
        
