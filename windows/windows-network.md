### Display or modify the network configuration
    netsh interface ipv4 show excludedportrange protocol=tcp
    
### Name server lookup
    nslookup example.myorg.com

### List of user groups
    net localgroup
    
### Check all port in use
    (admin user)
    netstat -ab
    
### Check AD groups and Password Expiry Date
    net user <id> /domain
    
