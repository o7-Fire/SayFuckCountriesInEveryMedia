require 'discordrb'

bot = Discordrb::Bot.new token: 'TOKEN'

bot.message(with_text: 'Fuck') do |event|
  File.readlines('countries.txt').each do |line|
  event.respond 'Fuck' line
  sleep(1)
end

bot.run
