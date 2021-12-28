import std/strutils
import os
#how lol
var countries = @["Russia", "USA", "Canada", "Australia"]
try:
  countries = splitLines(strip(readFile("../../countries.txt")))
except:
  let a = "lol how i do pass"
try:
  countries = splitLines(strip(readFile("countries.txt")))
except:
  echo("countries.txt not found")

while true:
  for i, c in countries:
    echo("Fuck ", c)
