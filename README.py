import os
import logging
from pathlib import Path
import re


logging.basicConfig(level=logging.INFO)

CWD = Path(os.getcwd())
RM = Path('README.md')
TEXT = RM.read_text('utf-8')

langs = set()
plats = {}

# Local machine automation hijacking script
# Komi can't communicate
# PRE_KOMI = '''
# python3 ../../README.py
# git add ../../README.md
# echo TABLE GENERATED
# '''
# HOOK = CWD / '.git/hooks/pre-commit'
# if HOOK.exists():
#     hook = HOOK.read_text()
#     if PRE_KOMI not in hook:
#         HOOK.write_text(hook + PRE_KOMI)
# else:
#     HOOK.write_text('#!/bin/sh\n' + PRE_KOMI)


for p in CWD.iterdir():
    if p.is_dir() and not p.name.startswith('.'):
        _p = p.name.capitalize()
        plats[_p] = []
        for d in p.iterdir():
            langs.add(d.name)
            plats[_p].append(d.name)

langs = [l.capitalize() for l in langs]
langs.sort()

# Generate table
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

# Replace section
text = RM.read_text('utf-8')
text = re.sub('<AUTOMATED>.+</AUTOMATED>', table, text, flags=re.S)
if text is not TEXT:
    logging.info("TABLE UP TO DATE")
    exit(0)
else:
    RM.write_text(text, 'utf-8')
    logging.info('TABLE GENERATED')

if os.getlogin() == "runner":
    logging.info("Not runner, skipping git commit")

os.system('git add README.md')
os.system('git commit -m "Matrix Update"')
os.system('git push')
