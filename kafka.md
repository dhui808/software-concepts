### Kafka
    Kafka is a distributed messaging system providing fast, highly scalable and redundant messaging through 
    a pub-sub model.
    
### Kafka key concepts
    A partition is a totally ordered sequence of records. A record has an offset, and it may have a 
    key and a value; both are byte arrays and both are optional.
    
    Multiple producers may publish to the same partition, but there is no recognised ordering across 
    producers
    
    A topic may have one or more partitions, and a partition must be a part of exactly one topic.
    The partitions within a topic are mutually independent.
    Certain records may be ordered in relation to one another (in the same partition) while being
    unordered with respect to certain other records (in different partitions).
    
    When publishing, producers can specify that records must be mutually ordered by assigning them the 
    same key. In other words, records that share a key will be published on the same partition.
    (This is critical where related messages must be processed sequentially.)
    
    Consumers subscribe to a topic as part of a consumer group. A consumer group balances the partition 
    load among its members.
    Kafka will never assign a partition to multiple consumers in the same group.
    (This guarantees that the same message is comsumed only once.)
        
    The act of consuming a record does not remove it. A consumer internally maintains an offset that 
    points to the next record in a partition, advancing the offset for every successive read. At some 
    point, the consumer must commit its offsets, writing them back to the Kafka cluster. Typically, 
    a consumer will read a record (or a batch of records) and commit the offset of the last record, 
    plus one. If a new consumer takes over the topic, it will commence processing from the last 
    committed offset.
    
    By default, a Kafka consumer will automatically commit offsets every 5 seconds, irrespective of 
    whether the consumer has finished processing the record.
    To enable manual offset committing, set the enable.auto.commit property to false.
    One can shift from an at-most-once to an at-least-once delivery model by simply moving the commit 
    operation from a point before the processing of a record is commenced, to a point sometime after 
    the processing is complete. With this model, should the consumer fail midway through processing 
    a record, the record will be re-read following partition reassignment.
    (In reality, once may always commit but move the failed message to an error queue/dead letter queue)
    
    Consumers across groups are entirely isolated. A topic may be read at a different cadence by any 
    number of consumer groups — each with their individual partition assignments and offsets.
    
    Each consumer within the group reads from a unique partition and the group as a whole consumes all 
    messages from the entire topic.
    
### At most once message delivery vs At least once message delivery
    For at most once message delivery, the consumer reads data from a partition, commits the offset 
    that it has read, and then processes the message. If the consumer crashes between committing the 
    offset and processing the message it will restart from the next offset without ever having 
    processed the message. This would lead to potentially undesirable message loss.
    
    For at least once delivery, the consumer reads data from a partition, processes the message, 
    and then commits the offset of the message it has processed. In this case, the consumer could 
    crash between processing the message and committing the offset and when the consumer restarts 
    it will process the message again. This leads to duplicate messages in downstream systems but 
    no data loss.
