## jq is a lightweight and flexible command-line JSON processor
## Install jq on GitBash on Windows
    Open Git Bash as administrator
    curl -k -L -o /usr/bin/jq.exe https://github.com/stedolan/jq/releases/latest/download/jq-win64.exe

## Get Okta token
    export TOKEN=$(curl -k -H "Authorization: Basic <base64_string>" -H "content-type: application/x-www-form-urlencoded" \
    -H "accept: application/json" -d 'grant_type=client_credentials&scope=sys:myscope1 sys:myscope2' \
    https://www.example.com | jq -r '.access_token')
    
## Invoking jq
    curl -s "http://openlibrary.org/search.json?q=st%C4%99pniak" | jq .

    curl -s "http://openlibrary.org/search.json?q=st%C4%99pniak" > openlibrary.json
    jq . openlibrary.json

## Extracting fields from the array
    jq '.docs[]' openlibrary.json
    jq '.docs[] | {title,author_name,publish_year}' openlibrary.json
    {
      "title": "Słownik tajemnych gwar przestępczych",
      "author_name": [
        "Klemens Stępniak"
      ],
      "publish_year": [
        1993
      ]
    }
    ...
    
    jq '.docs[0] | {title,author_name,publish_year}' openlibrary.json
    jq '.docs[] | {title,author_name: .author_name[0], publish_year: .publish_year[0]}' openlibrary.json
    
## Filtering null values with select(expr) filter
    jq '.docs[] | {title,author_name: .author_name[0], publish_year: .publish_year[0]} | select(.author_name!=null and .publish_year!=null)' openlibrary.json
    
## Sorting by field with sort_by(expr) filter
    jq '[.docs[] | {title,author_name: .author_name[0], publish_year: .publish_year[0]} | select(.author_name!=null and .publish_year!=null)]' openlibrary.json
    jq '[.docs[] | {title,author_name: .author_name[0], publish_year: .publish_year[0]} | select(.author_name!=null and .publish_year!=null)] | sort_by(.publish_year)' openlibrary.json
