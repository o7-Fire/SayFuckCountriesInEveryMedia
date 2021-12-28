local discordia = require('discordia')

local client = discordia.Client()


client:on('messageCreate', function(message, filename, fp, io)
	if message.content == 'Fuck' then
        filename = "countries.txt"
        fp = io.open( filename, "r" )
           for line in fp:lines() do
            message.channel:sendMessage(line)
         end
      end
  end)


client:run('TOKEN')
