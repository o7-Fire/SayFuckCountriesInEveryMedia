// https://github.com/nyxx-discord/nyxx/

import "package:nyxx/nyxx.dart";
import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main() {
  final bot = NyxxFactory.createNyxxWebsocket("ODk0Nzk4NDI0MzI1NjQwMjAy.GSm-SO.4VQik-Za6vWkQN5C6e_HLUV2Yz69vhmpfmkjfg", GatewayIntents.allUnprivileged)
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

