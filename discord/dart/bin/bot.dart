import "package:nyxx/nyxx.dart";
import 'dart:async';
import 'dart:io' show Platform;
import 'dart:convert';

void main() {
  Map<String, String> env = Platform.environment;
  final bot = NyxxFactory.createNyxxWebsocket(env["TOKEN"], GatewayIntents.allUnprivileged)
    ..registerPlugin(Logging()) 
    ..registerPlugin(CliIntegration()) 
    ..registerPlugin(IgnoreExceptions()) 
    ..connect();

    bot.eventsWs.onMessageReceived.listen((e) {
      if (e.message.content == "Fuck") {
      var path = "countries.txt";
      new File(path)
        .openRead()
        .map(utf8.decode)
        .transform(new LineSplitter())  
        .forEach((line) {
           e.message.channel.sendMessage(MessageBuilder.content('Fuck ${line}')); 
        });
      }
    });
  }

