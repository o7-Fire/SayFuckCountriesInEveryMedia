# download this https://github.com/ChaoticWeg/discord.sh/blob/master/discord.sh
# curl and JQ are your only requirements
# fuck you DOS, always use linux and not cygwin
# use dos2unix

#!/usr/bin/env bash

dos2unix countries.txt # you still need to do it on this file

input="countries.txt"

while IFS= read -r line
do
	#$WEBHOOK is for the file .webhook
	./discord.sh --webhook-url "$WEBHOOK" --username "Fuck $line" --text "Fuck $line"
	sleep 3
done < "$input"
