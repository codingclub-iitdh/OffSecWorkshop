This directory contains files related to cryptography. 

plain-text.txt is the original file containing actual sensitive information you want to protect.
changed_plain-text.txt is a slightly changed version of the above file.

enc_dec.sh: This script allows you to encrypt/decrypt a file which is to be passed as arguement to the script.
Encryption of file gives file.enc and decryption of file.enc gives back file

Execution example: 
	encryption : `./enc_dec.sh plain-text.txt`
	decryption : `./enc_dec.sh plain-text.txt.enc --decrypt`


hash.sh: This script allows you to create a hash of the file which is passed as arguement to script
Outputs hash of the file to file_hash

Execution example : `./hash.sh plain-text.txt`

You can find the hash of the slightly changed file is way different from original hash. You can better visualize it
with diff command as such: 
	`diff -uwi plain-text_hash.txt  changed_plain-text_hash.txt`

Some example executions are available but we recommend you running them again if you want to understand the flow better!!


Children Directory: 
	hash_collisions: Contains examples of weak hash functions giving same hash for modified/different content.
