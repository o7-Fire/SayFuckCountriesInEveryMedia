from discord.ext import commands

import func

class Fuck(commands.Cog):
    @commands.Cog.listener("on_message")
    async def on_fuck(self, message):
        if 'fuck' in message.content.lower():
            await message.channel.send(func.get_country())

def setup(bot):
    bot.add_cog(Fuck())
