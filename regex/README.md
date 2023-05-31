### grep
    export s='Physical id 0:  +67.0°C  (high = +84.0°C, crit = +100.0°C)'
    echo $s | grep -oP 'Physical\s+id\s+\d+:\s+\K[0-9+.]+°C'
    +67.0°C
    
    Details:

    Physical - a literal substring
    \s+ - 1+ whitespaces
    id\s+ - id and 1+ whitespaces
    \d+ - 1+ digits
    : - a colon
    \s+ - 1 or more whitespaces
    \K - match reset operator that discards all text matched so far
    [0-9+.]+ - 1 or more chars that are either digits, +, or .
    °C - literal °C text

### Capture html text field
    <input name="_csrf" type="hidden" value="82bc296d-0dbf-426a-9acc-1a4130bc87ee" />

    export s='<input name="_csrf" type="hidden" value="82bc296d-0dbf-426a-9acc-1a4130bc87ee" />'
    echo $s | grep -oP '.*<input\s+name=\"_csrf\"\s+type=\"hidden\"\s+value=\"\K[0-9a-z\-]+'
    
