using System;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using DSharpPlus;

namespace SayFuckCountriesInEveryMedia
{
    class Program
    {
        static void Main(string[] args)
        {
            MainAsync().GetAwaiter().GetResult();
        }

        static async Task MainAsync()
        {
            var discord = new DiscordClient(new DiscordConfiguration()
            {
                Token = "ODk0Nzk4NDI0MzI1NjQwMjAy.YVvP-A.jMtLQBRnaPwuudlhjtapDJmmKBU",
                TokenType = TokenType.Bot
            });

            discord.MessageCreated += async (s, e) =>
            {
                if (e.Message.Content.ToLower().StartsWith("Fuck"))
                {
                    const string Path = @"countries.txt";
                    string[] lines = File.ReadAllLines(path: Path);
                    foreach (string line in lines)
                    await e.Message.RespondAsync(line);
                    Thread.Sleep(4000);
                }
            };

            await discord.ConnectAsync();
            await Task.Delay(-1);
        }
    }
}





