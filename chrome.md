### Certificate
    Chrome picks and save imported certificates into Windows certificate store.
    To remove a Personal certificate imported,
    Windows Key + R
    Enter certmgr.msc
    
### Chrome automatically change http to https
	Go to chrome://net-internals/#hsts 
	Under "Delete domain security policies" enter your domain name and press Delete button.
	Clear your caches and cookies(CTRL+H > Clear browsing data) and try again.
	    
### Clear Cache for a page
	Go to Developer Tool
 	Right click the refresh button -> dropdown menu displays
	Empty Cache and Hard Reload

### Log all network calls to file
	chrome://net-export/
