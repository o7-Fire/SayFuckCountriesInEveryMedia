using System;
using System.Threading;
using System.Threading.Tasks;
using Discord;
using Discord.WebSocket;
using System.Collections.Generic;


namespace i_wanna_die
{
    class Program
    {
        private readonly DiscordSocketClient _client;
        static void Main(string[] args)
        {
            new Program().MainAsync().GetAwaiter().GetResult();
        }

        public Program()
        {
            _client = new DiscordSocketClient();

            _client.Log += LogAsync;
            _client.Ready += ReadyAsync;
            _client.MessageReceived += MessageReceivedAsync;
        }

        public async Task MainAsync()
        {
            await _client.LoginAsync(TokenType.Bot, Environment.GetEnvironmentVariable("token"));
            await _client.StartAsync();

            await Task.Delay(Timeout.Infinite);
        }

        private async Task MessageReceivedAsync(SocketMessage message)
        {
            if (message.Content == "Fuck")
            {
                int counter = 0;
                static void Main(string[] args)
                {
                    var random = new Random();
                    foreach (string line in System.IO.File.ReadLines("../../countries.txt")) ;
                    int index = random.Next(line.Count);
                    await message.channel.sendmessage(list[index]);
                }
            }
        }
    }
}
