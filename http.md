### POST, PUT, PATCH
    POST sends data to the server, not idempotent, may have additional effects. 
        Request has body. Successful response has body. Allowed in HTML forms
    PUT creates a new resource or replaces a resource, always idempotent, no side effect. 
        Request has body. Successful response may have body. Not allowed in HTML forms
    PATCH updates a resource,  not necessarily idempotent, although it can be, may have side-effects on other resources.
        Request has body. Successful response may have body. Not allowed in HTML forms

    The latest Internet Standard (https://www.rfc-editor.org/rfc/rfc9110.html) does not have PATCH method:
    The POST method requests that the target resource process the representation enclosed in the request according to 
    the resource's own specific semantics.
    The PUT method requests that the state of the target resource be created or replaced with the state defined by the 
    representation enclosed in the request message content.
    
###  Java Servlet Session tracking techniques:

    Cookies
    Hidden Form Field
    URL Rewriting
    HttpSession
    
    The first 3 ways can only use text information.

### System Unaavabible or time out
    503: Service Unavailable Error.
    504: Gateway Timeout 
    404: Not found
    
