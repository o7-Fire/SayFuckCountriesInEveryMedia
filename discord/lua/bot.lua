-- luvit bot.lua
-- lit install SinisterRectus/discordia

local discordia = require('discordia')
local open = io.open
local client = discordia.Client()

client:on('messageCreate', function(message)
	if message.content == 'Fuck' then
    file = io.open("countries.txt", "r")
     for line in fp:lines() do 
      message.channel:sendMessage('Fuck'.. line)
    end
    file:close()
  end
end)

client:run('TOKEN')
