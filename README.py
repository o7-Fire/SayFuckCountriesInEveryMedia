import os
import re
from pathlib import Path

# the fukc ?
CWD = Path(os.getcwd())
PRE_KOMI = '''
python3 ../../README.py
git add ../../README.md
echo TABLE GENERATED
'''

# what is this?
HOOK = CWD / '.git/hooks/pre-commit'
if HOOK.exists():
    hook = HOOK.read_text()
    if PRE_KOMI not in hook:
        HOOK.write_text(hook + PRE_KOMI)
else:
    HOOK.write_text('#!/bin/sh\n' + PRE_KOMI)

rm = Path('README.md')
langs = set()
plats = {}
orig = rm.read_text()


for p in CWD.iterdir():
    if p.is_dir() and not p.name.startswith('.'):
        _p = p.name.capitalize()
        plats[_p] = []
        for d in p.iterdir():
            langs.add(d.name)
            plats[_p].append(d.name)

langs = [l.capitalize() for l in langs]
langs.sort()

table = '<AUTOMATED>\n\n'
table += 'Media'
for l in langs:
    table += '|' + l
table += '\n' + '-'
for l in langs:
    table += '|' + '-'
table += '\n'
for p in plats:
    table += p
    for l in langs:
        table += '|' + ('✔️' if l in plats[p] else '❌')
    table += '\n'
table += '\n</AUTOMATED>'

ctx = rm.read_text('utf-8')
ctx = re.sub('<AUTOMATED>.+</AUTOMATED>', table, ctx, flags=re.S)
if ctx != orig:
    rm.write_text(ctx, 'utf-8')
    print('TABLE GENERATED')
else:
    print("TABLE UP TO DATE")
    exit(0)

if os.getlogin() != "runner":
    print("Not runner, skipping git commit")
    exit(0)

os.system('git add README.md')
os.system('git commit -m "Matrix Update"')
os.system('git push')
