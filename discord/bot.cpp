#include "sleepy_discord/sleepy_discord.h"
#include <string>
#include <iostream>
#include <fstream>

class MyClientClass : public SleepyDiscord::DiscordClient
{
public:
	using SleepyDiscord::DiscordClient::DiscordClient;
	void onMessage(SleepyDiscord::Message message) override
{
	if (message.startsWith("Fuck"))
		std::ifstream file("countries.txt");
	    std::string str;
	    while (std::getline(file, str))
		sendMessage(message.channelID, string);
}
};

int main()
{
	myClientClass client("token", SleepyDiscord::USER_CONTROLED_THREADS);
client.run();
}
