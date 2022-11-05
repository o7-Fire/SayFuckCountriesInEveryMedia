require "../src/discordcr" # shard.yml

client = Discord::Client.new(token: ENV["TOKEN"], client_id:  CLIENTID_u64);
cache = Discord::Cache.new(client)
client.cache = cache

client.on_message_create do |payload|
  if payload.content.starts_with? "Fuck"
    File.each_line("countries.txt") do |line|
    puts line
    client.create_message(payload.channel_id, "Fuck #{line}")
    sleep 3.seconds
    end
  end
end

client.run
