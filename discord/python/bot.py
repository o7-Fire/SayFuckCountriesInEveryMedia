import discord 
import random

TOKEN = 'TOKEN'

client = discord.Client()

@client.event 
async def on_message(message):
    if message.content.startswith('Fuck'):
        countries = open("../../countries.txt", "r").read().split("\n")
        country = random.choice(countries)
        await message.channel.send(country)

client.run(TOKEN)
