import dev.kord.core.Kord
import dev.kord.core.entity.ReactionEmoji
import dev.kord.core.event.gateway.ReadyEvent
import dev.kord.core.event.message.MessageCreateEvent
import dev.kord.core.on
import dev.kord.gateway.Intent
import dev.kord.gateway.PrivilegedIntent
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import java.io.File

suspend fun main(args: Array<String>) {


    val countries = File("countries.txt").readLines()

    val kord: Kord = Kord(System.getenv("DISCORD_TOKEN"))
    kord.on<MessageCreateEvent> {
        if (message.content != "fuck") return@on
        for(country in countries) {
            val join = launch {   message.channel.createMessage("fuck $country")}
            join.join()
        }
    }
    kord.on<ReadyEvent> {
        println("Ready! ${this.self.username}#${this.self.discriminator}")
    }
    kord.login {
        @OptIn(PrivilegedIntent::class)
        intents += Intent.MessageContent
    }
}