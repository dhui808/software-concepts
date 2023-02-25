### Design Singleton class

	1. Make sure it is stateless, i.e. no client data (state) is shared (i.e. the class variables and instance variables 
	   do not contain any client-specific data)
	2. Shared data (i.e. configuration parameters) are OK to be used as class variables and instance variables. Proper
	   synchronization mechanism must be in place if the shared data are modified.
	3. Even if the shared data are modified in a thread-safe way, we still need to make sure that there is no unexpected
	   business impact. In other words, this modification to the shared data must be tested in dev/qa/uat.
	   
