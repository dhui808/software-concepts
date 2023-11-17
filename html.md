### Include another HTML file
    <div w3-include-html="content.html"></div>

    <script>w3.includeHTML();</script>
### URL Encoding (Percent Encoding)
    URL encoding converts characters into a format that can be transmitted over the Internet.
    URLs can only be sent over the Internet using the ASCII character-set.
    Since URLs often contain characters outside the ASCII set, the URL has to be converted into a valid ASCII format.
    URL encoding replaces unsafe ASCII characters with a "%" followed by two hexadecimal digits.
    URLs cannot contain spaces. URL encoding normally replaces a space with a plus (+) sign or with %20.
    
    HTML encoding ensures that text will be correctly displayed in the browser, not interpreted by the browser as HTML.
    (So the request to backend does not HTML encoding, and the response from backend may need HTML encoding).
    
