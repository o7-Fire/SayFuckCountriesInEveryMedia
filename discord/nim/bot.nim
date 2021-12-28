# nimble install dimscord

import dimscord, asyncdispatch, times, options

let discord = newDiscordClient("TOKEN")


proc messageCreate(s: Shard, m: Message) {.event(discord).} =
    if m.author.bot: return
    if m.content == "Fuck": 
    for line in lines "../../countries.txt":
    msg = await discord.sendMessage(m.channel, "Fuck" line)

waitFor discord.startSession()
