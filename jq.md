## Invoking jq
    curl -s "http://openlibrary.org/search.json?q=st%C4%99pniak" | jq .

    curl -s "http://openlibrary.org/search.json?q=st%C4%99pniak" > openlibrary.json
    jq . openlibrary.json

## Extracting fields
    
