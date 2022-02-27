#!/bin/bash

declare -A APS
declare -A ALS

# List medias
_PS=( $(find * -maxdepth 0 -type d) )
echo "${#_PS[@]} MEDIA(S) FOUND:"
mapfile -d '' _PS < <(
    printf '%s\0' "${_PS[@]}" | sort -z)
echo ${_PS[@]^^}
echo
for P in ${_PS[@]}
do
    # List languages in media
    _LS=( $(cd $P && find * -maxdepth 0 -type d) )
    echo "${#_LS[@]} LANGUAGE(S) FOUND IN ${P^^}:"
    _LS=( ${_LS[@]^} ) # Capitalize
    LSS=${_LS[@]} # To string
    echo ${LSS^^}
    APS[${P^}]=" $LSS " # Map to medias
    # Map to languages
    for L in ${_LS[@]} 
    do 
        ALS[$L]=""
    done
done
# Convert to array & sort
mapfile -d '' LS < <(
    printf '%s\0' "${!ALS[@]}" | sort -z)
echo "${#LS[@]} LANGUAGE(S) IN TOTAL"
echo

# Building Table
echo "CONSTRUCTING TABLE"
TABLE="| Media |" 
# List Languages
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
# Create language checklist per media
for P in ${!APS[@]}
do
    TABLE+="| $P |"
    for L in ${LS[@]} 
    do
        # Check if language in media
        if [[ ${APS[$P]} == *" $L "* ]] 
        then
            A=$(find * -iname "${P,,}")
            B=$(cd $A && find * -iname "${L,,}")
            IMPC=$(cd "./$A/$B" && ls)
            # Check if developers are useless
            if [[ $IMPC == *"IMPOSSIBLE.txt"* ]]
            then
                TABLE+=" - "
            else
                TABLE+=" ✓ "
            fi
        else # Lazy developers
            TABLE+=" X "
        fi
        TABLE+="|"
    done
    TABLE+="\n"
done
TABLE=$(printf '%b\n' "$TABLE")

# Updating Table
OLD=$(cat README.md)
G=GENERATED
BR="\n\n"
perl -0777 -i -pe \
    "s/(<$G>).*(<\/$G>)/\$1$BR$TABLE$BR\$2/s" \
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
git config --global user.email volas@github.com
git config --global user.name Volas
git add README.md
git commit -m "GENERATED"
git push
