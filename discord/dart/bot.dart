// https://github.com/nyxx-discord/nyxx/

import "package:nyxx/nyxx.dart";
import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main() {
  final bot = NyxxFactory.createNyxxWebsocket("TOKENHERE", GatewayIntents.allUnprivileged)
    ..registerPlugin(Logging()) 
    ..registerPlugin(CliIntegration()) 
    ..registerPlugin(IgnoreExceptions()) 
    ..connect();

  bot.eventsWs.onMessageReceived.listen((e) {
    if (e.message.content == "Fuck") {
    var path = "../../countries.txt";
    new File(path)
      .openRead()
      .map(utf8.decode)
      .transform(new LineSplitter())
      .forEach((line) { e.message.channel.sendMessage(MessageBuilder.content('Fuck ${line}')); });
    }
  });
}
