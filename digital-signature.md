### Why digital signature?
	Through the use of a trusted third party, digital signatures can be used to identify and verify individuals and ensure the integrity of the message.

### Hash function
	A fixed-length string of numbers and letters generated from a mathematical algorithm against an arbitrarily sized file (email, document, picture, 
	etc.). This generated string is unique to the file and is a one-way function — a computed hash cannot be reversed to find other files that may 
	generate the same hash value. 
	
	Hashing algorithms: 
		Secure Hash Algorithm-1 (SHA-1)
		Secure Hashing Algorithm-2 family (SHA-2 and SHA-256)
		Message Digest 5 (MD5)

### How Digital signatures work?
	Digital signatures prove that a digital message or document was not modified from the time it was signed.
	
	Digital signatures generate a unique hash of the document and encrypting it using the sender’s private key. The hash generated is unique 
	to the document, and changing any part of it will completely change the hash.
	
	Once the document is digitally signed (i.e. the digital signature is attached to the document), it is sent to the recipient. 
	The recipient generates their own hash of the document and decrypts the sender’s hash (included in the original message) using the sender’s
	public key. The recipient compares the hash they generate against the sender’s decrypted hash; if they match, the document has not been 
	modified and the sender is authenticated.

### Public key infrastructure (PKI)
	PKI consists of the policies, standards, people, and systems that support the distribution of public keys and the identity validation of 
	individuals or entities with digital certificates and a certificate authority.

### Pretty Good Privacy (PGP)/OpenPGP
	PGP/OpenPGP is an alternative to PKI. With PGP/OpenPGP, users “trust” other users by signing certificates of people with verifiable identities.
	The more interconnected these signatures are, the higher the likelihood of verifying a particular user on the internet. This concept is called 
	the “Web of Trust.”
	
