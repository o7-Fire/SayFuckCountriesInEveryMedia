# fuck you DOS, always use linux and not cygwin
# use dos2unix
# you need tweet.sh
# curl, jq, nkf and openssl you need
# FOLLOW THE GUIDE: https://github.com/piroor/tweet.sh

#!/usr/bin/env bash

dos2unix countries.txt # you still need to do it on this file


input="countries.txt"

while IFS= read -r line
do
	./tweet.sh post "Fuck $line"
    sleep 3
done < "$input"
