### Circuit Breaker
    The Circuit Breaker pattern prevents an application from performing an operation that is likely to fail.

    The idea of circuit breakers is to prevent calls to a remote service if we know that the call is likely to fail or time out.
    We do this so that we don’t unnecessarily waste critical resources both in our service and in the remote service.

    A circuit breaker acts as a proxy for operations that might fail. The proxy should monitor the number of recent failures 
    that have occurred, and use this information to decide whether to allow the operation to proceed, or simply return an exception 
    immediately.

    Circuit Breaker stops cascading failures caused by the downstream service failure and gives overwhelmed or failing services 
    time to recover.

     transient faults, such as slow network connections, timeouts, or the resources being overcommitted or temporarily unavailable. 

    Circuit Breaker deals with system failure like service unavailable or timeout, but not the user error and programming errors. 
    However, whether it is able to differentiate different errors is a different problem - it probably can not.
    
    In Spring Cloud Hystrix, one can pass Throwable e as input parameter to the fallback method. In this way one can retrieve the 
    original exception wrapped inside.

    References
    https://docs.microsoft.com/en-us/azure/architecture/patterns/circuit-breaker
    https://martinfowler.com/bliki/CircuitBreaker.html

### Hystrix
    The Hystrix circuit will break if:

    within a timespan of duration metrics.rollingStats.timeInMilliseconds, the percentage of actions resulting in a handled 
    exception exceeds errorThresholdPercentage, provided also that the number of actions through the circuit in the timespan is 
    at least requestVolumeThreshold.
    
### Spring Cloud Hystrix: 
    The fallback method, if defined, is always invoked regardless of @HystrixProperty(name = "circuitBreaker.requestVolumeThreshold", 
    value = "4") setting
    The Throwable parameter in the fallback method always has null cause the root cause exception is swallowed. This is bad.
  
    1. Service down, no fallback:
    com.netflix.hystrix.exception.HystrixRuntimeException: readingList timed-out and fallback failed.
    Caused by: java.util.concurrent.TimeoutException

    2. Service call timeout, no fallback
    com.netflix.hystrix.exception.HystrixRuntimeException: readingList timed-out and fallback failed.
    Caused by: java.util.concurrent.TimeoutException

    3. Application programming error, no fallback
    org.springframework.web.client.HttpServerErrorException$InternalServerError: 500 : [{"timestamp":"2021-01-16T18:21:53.828+00:00",
    "status":500,"error":"Internal Server Error","message":"","path":"/recommended"}]

    4. Service down, with fallback
    fallback method invoked.
    com.netflix.hystrix.exception.HystrixTimeoutException

    5. Service call timeout, with fallback
    fallback method invoked.
    com.netflix.hystrix.exception.HystrixTimeoutException

    6. Application programming error, with fallback
    fallback method invoked.
    org.springframework.web.client.HttpServerErrorException$InternalServerError: 500 : [{"timestamp":"2021-01-16T19:01:02.923+00:00",
    "status":500,"error":"Internal Server Error","message":"","path":"/recommended"}]

    7. service down, with fallback throwing exception
    fallback method invoked.
    com.netflix.hystrix.exception.HystrixTimeoutException
    2021-01-17 18:45:44.311 ERROR 9068 --- [ HystrixTimer-1] c.n.h.c.javanica.command.GenericCommand  : failed to processed fallback 
    is the method: 'reliable'. 
    com.netflix.hystrix.exception.HystrixRuntimeException: readingList timed-out and fallback failed.
    Caused by: java.util.concurrent.TimeoutException

    8. service call timeout, with fallback throwing exception
    fallback method invoked.
    com.netflix.hystrix.exception.HystrixTimeoutException
    2021-01-26 11:27:56.867 ERROR 21332 --- [ HystrixTimer-1] c.n.h.c.javanica.command.GenericCommand  : failed to processed fallback 
    is the method: 'reliable'. 
    com.netflix.hystrix.exception.HystrixRuntimeException: readingList timed-out and fallback failed.
    Caused by: java.util.concurrent.TimeoutException

    9. Application programming error, with fallback throwing exception
    fallback method invoked.
    org.springframework.web.client.HttpServerErrorException$InternalServerError: 500 : [{"timestamp":"2021-01-26T16:33:17.682+00:00",
    "status":500,"error":"Internal Server Error","message":"","path":"/recommended"}]
    2021-01-26 11:33:17.708 ERROR 2296 --- [x-BookService-1] c.n.h.c.javanica.command.GenericCommand  : failed to processed fallback 
    is the method: 'reliable'. 
    java.lang.RuntimeException: reliable throws exception.
