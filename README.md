[#]:#<<\<\!--&>/dev/null
## SayFuckCountriesInEveryCountries :afghanistan::egypt::jordan:

Use `{language_framework_language}` to say fuck `{country}` on `{platform}`

I, Robert would be welcome if you contribute and make a PR.

<details open>
<summary>Languages Included</summary>
<GENERATED>

| Media | Bash | C | C# | C++ | Clojure | Cobol | Crystal | Dart | Go | Java | Javascript | Julia | Kotlin | Lua | Nim | Perl | Powershell | Python | Ruby | Rust | Swift |
| --- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| Discord | ✓ | ✓ | ✓ | ✓ | ✓ | [<div>-</div>](discord/Cobol/IMPOSSIBLE.txt) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | X | ✓ | ✓ | ✓ | ✓ | ✓ |
| Github | [<div>-</div>](github/Bash/IMPOSSIBLE.txt) | X | X | X | X | X | [<div>-</div>](github/Crystal/IMPOSSIBLE.txt) | X | X | X | X | X | X | X | X | X | ✓ | ✓ | ✓ | X | X |
| Kahoot | [<div>-</div>](kahoot/Bash/IMPOSSIBLE.txt) | X | X | X | X | X | [<div>-</div>](kahoot/Crystal/IMPOSSIBLE.txt) | [<div>-</div>](kahoot/Dart/IMPOSSIBLE.txt) | X | X | X | X | X | X | X | X | [<div>-</div>](kahoot/Powershell/IMPOSSIBLE.txt) | ✓ | [<div>-</div>](kahoot/Ruby/IMPOSSIBLE.txt) | X | [<div>-</div>](kahoot/Swift/IMPOSSIBLE.txt) |
| Stdout | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | X | ✓ | ✓ | X | X | X | ✓ | X | ✓ | ✓ | ✓ | ✓ | ✓ |
| Twitter | ✓ | X | ✓ | X | ✓ | X | ✓ | X | X | X | ✓ | X | X | ✓ | X | ✓ | ✓ | ✓ | ✓ | X | X |

</GENERATED>
</details>

## TODO
- [ ] Dockerize the repository

## Functions
- `Discord` - changes between Fuck {Country} (Discord User Status/Discord Bot)
- `Matrix` - User Status changes between Fuck {Country}
- `Twitter` - Tweet about Fuck {Country}
- `Github` - Markdown file content
- `Kahoot` - Fill server with bots named Fuck {Country}
- `Stdout` - Standard output is a stream to which a program writes its output data.

## Info
- Make sure it runs on your machine, we don't care about other machine.
- Do not commit library, cache, or anything else that is not important e.g. `node_module`,`output`, `build`, `cache`.
- File path should follow the format above.
- For impossible implementation (or you're lazy), create `platform/language/IMPOSSIBLE.txt`. **PROVIDE** a technical reason why it's impossible

<!--
#!/bin/bash
echo START
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
    PLS=${PLS[@]}
    shopt -s nocasematch
    for L in ${LS[@]}
    do
        if [[ $PLS =~ .*($L/impossible\.txt).* ]] 
        then
            TABLE+=" [<div>-<\/div>]($P\/${BASH_REMATCH[1]/\//\\/}) "
        elif [[ $PLS == *$L/* ]] 
        then
            TABLE+=" ✓ "
        else 
            TABLE+=" X "
        fi
        TABLE+="|"
    done
    shopt -u nocasematch
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
#-->




