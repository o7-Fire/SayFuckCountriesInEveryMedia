using Discord

function on_message_create(c::Client, event::MessageCreate)
    if event.message.content == "Fuck"
    open("countries.txt") do file
        for ln in eachline(file)
        reply(c, event.message,'Fuck' + ln)
        end
    end
end

function main()
    c = Client("TOKEN")
   #c = Client(ENV["TOKEN"])
    open(c)
    add_handler!(c, MessageCreate, on_message_create; tag=:Fuck)
    return c
end

end
