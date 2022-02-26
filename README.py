import os
from pathlib import Path
import re


CWD = Path(os.getcwd())


rm = Path('README.md')
langs = set()
plats = {}


for p in CWD.iterdir():
    if p.is_dir() and not p.name.startswith('.'):
        plats[p.name] = []
        for d in p.iterdir():
            langs.add(d.name)
            plats[p.name].append(d.name)

langs = list(langs)
langs.sort()

table = '<AUTOMATED>\n\n'
table += '|Media|'
for l in langs:
    table += f'{l}|'
table += '\n'
table += '|-|'
for l in langs:
    table += '-|'
table += '\n|'
for p in plats:
    table += f'{p}|'
    for l in langs:
        table += '✔️' if l in plats[p] else '❌' 
        table += '|'
    table += '\n'
table += '\n<AUTOMATED>\n'

print(table)

ctx = rm.read_text('utf-8')
ctx = re.sub('<AUTOMATED>.+<AUTOMATED>', table, ctx, flags=re.S)
rm.write_text(ctx, 'utf-8')
