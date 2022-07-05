### NoSQL DB
    NoSQL databases were developed during the Internet era in response to the inability of SQL databases to address the needs 
    of web scale applications that handled huge amounts of data and traffic.
    
    
    
    With column types, the data is stored by columns which can enable efficient aggregation operations / queries on a particular 
    column.
    With document types, the entire document is logically stored in one place and is generally retrieved as a whole (no efficient 
    aggregation possible on "columns" / "fields").
    
### Types of NoSQL DB
    Document databases
    Key-value stores
    Column-oriented databases
    Graph databases

    A document database stores data in JSON, BSON , or XML documents.
    documents can be nested. 
    Particular elements can be indexed for faster querying.
    Use cases include ecommerce platforms, trading platforms, and mobile app development across industries.
    
    The simplest type of NoSQL database is a key-value store
    a key-value store is like a relational database with only two columns: the key or attribute name (such as state) and the 
    value (such as Alaska).
    Use cases include shopping carts, user preferences, and user profiles.
    
    a column store is organized as a set of columns. when you want to run analytics on a small number of columns, you can 
    read those columns directly without consuming memory with the unwanted data. 
    Columnar databases can quickly aggregate the value of a given column (adding up the total sales for the year).
    Use cases include analytics.
    
    A graph database focuses on the relationship between data elements. Each element is stored as a node (such as a person 
    in a social media graph). The connections between elements are called links or relationships. In a graph database, 
    connections are first-class elements of the database, stored directly. In relational databases, links are implied, 
    Use cases include fraud detection, social networks, and knowledge graphs.

### Performance Improvement
    Examine query patterns
        Analyzing your query patterns and determining where you can embed data rather than doing in-application or in-database joins.
        Storing the results of frequent sub-queries on documents to reduce read load
        Making sure that you have indices on any fields you regularly query against.
    Review data modeling and indexing
        Deciding when to embed a document or create a reference between separate documents in different collections instead
    Try embedding and referencing
    Increasing memory
    Replication and sharding
    
    Pagination
    
    
    
