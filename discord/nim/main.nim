import std/strutils
import os

if paramCount() == 0:
    print("Usage: main <token>")
    exit(1)

const token = paramStr(0)
if len(token) < 50:
    print("Invalid token")
    exit(1)

let countries: seq[string] = splitLines(strip(readFile("../../countries.txt")))
for i, c in countries:
  echo(i, ": ", c)


