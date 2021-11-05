## Backpressure Strategies
    Control the data stream (slow down/speed up is decided by consumer)
    Buffer (accumulate incoming data spikes temporarily)
    Drop (sample a percentage of the incoming data)
    
    However, only Buffer is a true solution.
