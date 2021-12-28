require "../src/discordcr"

client = Discord::Client.new(token: "", client_id: )

client.on_message_create do |payload|
  if payload.content.starts_with? "Fuck"
    File.each_line("countries.txt") do |line|
    puts line
    client.create_message(payload.channel_id, "Fuck #{line}")
    end
  end
end

client.run
