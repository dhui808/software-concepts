### Double-quotes vs single-quotes in -d option
    Windows: use double-quotes
    Linux: single-quotes
  
### Using Okta token in a REST call
    curl -k https://www.example.com -H "Authorization: Bear $TOKEN" -H "accept: application/json" -H "X-XXX-Client-Id: 7658-3643-y7ergij"
