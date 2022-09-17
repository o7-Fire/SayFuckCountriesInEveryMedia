require 'discordrb'

bot = Discordrb::Bot.new token: 'TOKEN'

bot.message(with_text: 'Fuck') do |event|
  f = File.open("countries.txt", "r")
  f.each_line do |line|
  event.respond 'Fuck' line
end

bot.run
