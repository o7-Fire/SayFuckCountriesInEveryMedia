# download this https://github.com/ChaoticWeg/discord.sh/blob/master/discord.sh 
# curl and JQ are your only requirements
# fuck you DOS, always use linux and not cygwin

#!/usr/bin/env bash

input="countries.txt"

while IFS= read -r line
do
  #$WEBHOOK is for the file .webhook
	./discord.sh --webhook-url "$WEBHOOK" --username "Fuck $line" --text "Fuck $line"
  	sleep 3
done < "$input"
