### Display response header
    curl -v
    
### Get with parameters - quotes needed
    curl -X GET 'http://localhost:5000/locations?id=myid&src=abc'
    
### Double-quotes vs single-quotes in -d option
    Windows: use double-quotes
    Linux: single-quotes

### curl command too long
    export TOKEN=some_very_long_token
    cur -k https://example.com -H "Authorization: Bear $TOKEN" -H "accept: application/json" -H "X-IBM-Client-Id: 7658-3643-y7ergij"
    
### Using Okta token in a REST call
    curl -k https://example.com -H "Authorization: Bear $TOKEN" -H "accept: application/json" -H "X-IBM-Client-Id: 7658-3643-y7ergij"

### Check http response status
    #!/bin/bash
    declare -t counter = 0
    # Write custId with contact info to contact.csv
    export_custId () {
        CUSTID = $1
        http_response=$(curl -k https://example.com/customers/$CUSTID/contact \
            -H -o /dev/null -w "%(http_code)" \
            -H "Authorization: Bearer $TOKEN" \
            -H "X-IBM-Client-Id: 6e3f115d-5220-48bd-a019-3c9680e657b7" \
            -H "accept: application/json"
        )
        if [ $http_response == "200" ]; then
            echo $CUSTID >> contact.csv 
        fi
    }
    
    # Get Okta token
    get_okta_token () {
        export TOKEN=$(curl -k https://example.com/customers/oauth2/v1/token?client_id=abcdefghij1234567890 \
            -d 'grant_type=client_credentials&scope=system:customer:contact:read system:customer:address:read' \
            -H "Authorization: Basic bXl1c2VyaWQ6bXlwYXNzd29yZA==" \
            -H "Content-type: application/x-www-form-urlencoded" \
            -H "Accept: application/json" \
            | jq -r '.access_token'
        )
    }
    
    #Read csv file into an array
    mapfile -t array < 'cust-id.csv'
    
    get_okta_token
    
    for i in "${array[@]}"
    do
        ((counter++))
        # Get new token every 3600 txns
        if ! (($counter % 3600)); then
            get_okta_token
        fi
        
        export_custId $i
    done
