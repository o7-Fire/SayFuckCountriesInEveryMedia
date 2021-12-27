# pip install kahootpy
from kahoot import client
import random

countries = open("countries.txt", "r").read().split("\n")
bot = client()

gameid = input("Enter the game pin: ")
botamount = input("Enter the amount of bots: ")

def joingame():
    bot.join(gameid, f"Fuuck {random.choice(countries)} {str(random.randint(1, 10000))}")

    def joinHandle():
        pass

    bot.on("joined", joinHandle)
    print("Joined game " + gameid + ".")
    
for x in range(0, (int(botamount))):  # + 10  this is not code
    joingame()
