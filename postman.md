### Set global environment variables with test scripts
    Tests scripts execute after the response is received.
    Test scripts are JavaScript
    
    pm.test("Status test", function () {
        pm.globals.set("oauth_token", pm.response.json().access_token);
        pm.globals.unset("oauth_token_test");
    });
