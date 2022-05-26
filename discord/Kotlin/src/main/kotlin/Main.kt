import java.io.File;

suspend fun main() {
    val kord = Kord("TOKEN")

    kord.on<MessageCreateEvent> {
        if (message.content != "Fuck") return@on
        var read = File("countries.txt").forEachLine
        for (line in read) {
            message.channel.createMessage(read)
            delay(3000)
        }
    }

    kord.login {
        @OptIn(PrivilegedIntent::class)
        intents += Intent.MessageContent
    }
}
