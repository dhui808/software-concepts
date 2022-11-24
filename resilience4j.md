### Resilience4J Configuration
    https://stackoverflow.com/questions/63443264/how-to-create-circuit-breaker-config-from-application-properties
    
    automaticTransitionFromOpenToHalfOpenEnabled has no effect?

### Enable/Disable Resilience4J CircuitBreaker
    Create Spring Actuator for enable/disable CB
    https://stackoverflow.com/questions/58972823/spring-boot-actuator-custom-restcontrollerendpoint-with-requestmapping-annotatio
    
    @Component
    @RestControllerEndpoint(id = "tenant")
    public class CircuitBreakerActuator {

        @Autowired
        private CircuitBreakerRegistry registry;
        @GetMapping("/disable/{cb-service-name}")
        public String getTenantById(@PathVariable("cb-service-name") String cbServiceName) {
            registry.circuitBreaker(name).transitionToDisabledState();
            return cbServiceName + " is disabled.";
        }
    }

    Using curl command:
    curl http://myhost.com/actuator/tenant/disable/{cb-service-name}
    
    
