### Search by Event Attributes
    @endpoint:/myapp/uat/v1/*/custprofile
    where endpoint is an event attribute

### NOT Operator
    service:*myserivce-* -GC -@resourceId:SUBSCRIPTIONS -UNKNOWN
    Exclude GC, resourceId:SUBSCRIPTIONS, UNKNOWN
    
