## Fetch a remote SSL certificate details:
    keytool -printcert -sslserver $host[:$port] -rfc > temp.crt

## Import cert into truststore
    keytool -importcert -alias mycertid -file public.cert -storetype JKS -keystore servertruststore.jks -storepass mystorepassword

## View the cert in the truststore
    keytool -v -list -keystore servertruststore.jks -storepass mystorepassword -alias mycertid

## View all certs in the truststore
    keytool -v -list -keystore servertruststore.jks -storepass mystorepassword > servertruststore.jks.txt

## Delete the cert in the truststore
    keytool -v -delete -keystore servertruststore.jks -storepass mystorepassword -alias mycertid
    
## jdk/openjdk unlimited cryptography policy:
    https://github.com/open-eid/cdoc4j/wiki/Enabling-Unlimited-Strength-Jurisdiction-Policy
    Java 8 Update 151 and higher:
    uncomment the following line:
    crypto.policy=unlimited

    Java 9: enabled by default
    OpenJDK: enabled by default
