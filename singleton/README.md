### Key Design Considerations of a Singleton Class
	Remeber that a singleton class is NOT automatically thread-safe. The designer needs to
	design the singleton class in a way that guarantees that it is thread-safe. 
	
	1. Can have immutable instance variables,
	2. Can have thread-safe dependencies,
	3. Cannot have instance variables that contain caller-specific data, like HTTPRequest, 
	   even if they are immutable.
	4. Can have mutable instance variables that include common and shared data, as long as
	   these variables are protected for thread-safty.
	   
