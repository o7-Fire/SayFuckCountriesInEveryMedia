import "package:nyxx/nyxx.dart";
import 'dart:io';
import 'dart:async';
import 'dart:convert';



void main() {
  final bot = NyxxFactory.createNyxxWebsocket("TOKEN", GatewayIntents.allUnprivileged)
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions())
    ..connect();

 bot.eventsWs.onMessageReceived.listen((e) {
    if (e.message.content == "Fuck") {
      var path = '../../countries.txt';
      new File(path)
      .openRead()
      .map(utf8.decode)
      .transform(LineSplitter());
      .forEach((l) => e.message.channel.sendMessage(l));
    }
  });
}
