This directory contains 2 images which are vastly different but contain the same hash when using MD5 hash function, an outdated algorithm

md5_hash.sh: Script to generate md5 hash of the file given as input arguement.
Outputs the hash of file into file_hash

Execution: `./md5_hash.sh plane.jpg`
	   `./md5_hash.sh ship.jpg`

You can use the diff command to find if the hash mathing as:
	`diff -uwi plane_hash.txt ship_hash.txt`
