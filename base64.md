### To base64 encode test.jks file, using Git Bash
    base64 -w 0 test.jks > test.jks.txt
    where option -w 0 means no wrap
    
### To decode base64 jks truststore file to the truststore jks file
    cat my-truststore.jks.txt | base63 -d > my-truststore.jks
    
### To base64 encode string:
    echo -n <string> | base64
    where option -n means ignore a new line character on the end of the line.

### To generate HTTP Basic Authorization header from username:password:
    echo -n username:password | base64 -w 0

## To decode HTTP Basic Authorization
    echo uihf7846583ieoj90409ti034jf9048uor== | base64 -d
    This will generate username:password pair

### To generate HTTP Basic Authorization header From the browser developer console:
    window.btoa("username:password")
