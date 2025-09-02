### Search by Event Attributes
    @endpoint:/myapp/uat/v1/*/custprofile
    where endpoint is an event attribute

### NOT Operator
    service:*myserivce-* -GC -@resourceId:SUBSCRIPTIONS -UNKNOWN
    Exclude GC, resourceId:SUBSCRIPTIONS, UNKNOWN
    
### Kafka logs - Turn on the toggle "Include Flex Logs"
    service:*myserivce-* -@evt.category:AppServiceHTTPLogs @logger.thread_name:org.springframework.kafka.*
    service:*myserivce-* *Exception NOT azure.sdk.message
