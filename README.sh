#!/bin/bash

# List languages
LS=( $(find * -maxdepth 1 -mindepth 1 -type d -printf "%f\n") )

declare -A ALS
for L in ${LS[@]}
do 
    ALS[${L^}]=""
done

mapfile -d '' LS < <(printf '%s\0' "${!ALS[@]}" | sort -z)

echo "${#LS[@]} LANGUAGE(S) FOUND"
echo ${LS[@]^^}

# Building Table
echo "CONSTRUCTING TABLE"
TABLE="| Media |" 

for L in ${LS[@]}
do
    TABLE+=" $L |"
done
TABLE+="\n"

TABLE+="| --- |" 
for L in ${LS[@]}
do
    TABLE+=" :-: |"
done
TABLE+="\n"

# Check languages per media
PS=( $(find * -maxdepth 0 -type d) )
for P in ${PS[@]}
do
    TABLE+="| ${P^} |"
    PLS=$(cd $P && find * -maxdepth 1)
    PLS=${PLS[@],,}
    for L in ${LS[@]}
    do
        L=${L,,}
        if [[ $PLS == *" $L/impossible.txt "* ]] 
        then
            TABLE+=" - "
        elif [[ $PLS == *" $L "* ]] 
        then
            TABLE+=" ✓ "
        else 
            TABLE+=" X "
        fi
        TABLE+="|"
    done
    TABLE+="\n"
done
TABLE=$(printf '%b\n' "$TABLE")

# Updating Table
OLD=$(cat README.md)
perl -0777 -i -pe \
    "s/(<GENERATED>).*(<\/GENERATED>)/\$1\n\n$TABLE\n\n\$2/s" \
    README.md
NEW=$(cat README.md)
if [[ $NEW == $OLD ]] 
then
    echo "TABLE UP TO DATE"
    exit 0
else
    echo "TABLE UDPATED"
fi

# Runtime commit
if [[ $USER != "runner" ]]
then
    echo "NOT RUNNER, SKIPPING COMMIT"
    exit 0
fi

# Push changes to git(hub)
echo "COMMITING"
git config --global user.email volas@mindustry.me #stolen
git config --global user.name Not Volas
git add README.md
git commit -m "Update README.md"
git push
