import sys
import random

countries = open("../../countries.txt", "r").read().split("\n")
sys.stdout.write(f"Fuck {random.choice(countries)}")
