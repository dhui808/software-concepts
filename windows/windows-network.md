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
    
### Check which app is running at which port - Resource Monitor
    resmon

### Stop a process running at a specific port
    Run command-line as an Administrator. Find the PID
    netstat -ano | findstr : port number

    execute this command after identify the PID.
    taskkill /PID yourPID /F
