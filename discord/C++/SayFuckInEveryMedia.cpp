// dpp.dev

#include <dpp/dpp.h>
#include <fstream>

int main() {
    dpp::cluster bot("TOKEN");

    bot.on_ready([&bot](const auto& event) {
        std::cout << "Logged in as " << bot.me.username << "!\n";
    });

    bot.on_message_create([&bot](const dpp::message_create_t& event) {
        if (event.msg.content == "test") {
            std::string line;
            std::ifstream myfile;
            myfile.open("countries.txt");
            while (getline(myfile, line)) {
                dpp::message msg(event.msg.channel_id, "Fuck" + line);
            }
        }
    });
    bot.start(false); // change this to true 
    return 0;
}

// who knows if it's gonna work
