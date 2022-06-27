## Reactive Programming
    Responsive: a reactive system needs to handle requests in a reasonable time
    Resilient: a reactive system must stay responsive in the face of failures (errors, crashes, timeouts, etc), so it
        must be designed to be able to gracefully handle failures
    Elastic: a reactive system must stay responsive under various loads - being able to scale both up and down.
    Message driven: components from a reactive system interact using asynchronous message passing to enable loose coupling, 
        isolation and location transparency.

## Backpressure Strategies
    Control the data stream (slow down/speed up is decided by consumer)
    Buffer (accumulate incoming data spikes temporarily)
    Drop (sample a percentage of the incoming data)
    
    However, only Buffer is a true solution.
