# fuck you DOS, always use linux and not cygwin
# use dos2unix

#!/usr/bin/env bash

dos2unix countries.txt # you still need to do it on this file


input="countries.txt"

while IFS= read -r line
do
	printf "Fuck $line"
    sleep 3
done < "$input"
