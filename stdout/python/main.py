import sys
import random

countries = open("../../countries.txt", "r").read().split("\n")
while True:
  sys.stdout.write(f"Fuck {random.choice(countries)}")
