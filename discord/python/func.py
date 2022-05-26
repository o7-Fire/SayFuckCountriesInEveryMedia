from pathlib import Path
from random import choice, shuffle


COUNTRIES = (Path(__file__).parents[2]/'countries.txt').read_text().split("\n")
FUCK_COUNTRIES = ['Fuck ' + c for c in COUNTRIES]
ALL_COUNTRIES = len(COUNTRIES)


get_country = lambda : choice(FUCK_COUNTRIES)


def get_countries(count: int): 
    fs = FUCK_COUNTRIES if count == ALL_COUNTRIES else [
        choice(FUCK_COUNTRIES) for _ in range(count)]
    shuffle(fs)
    return fs
