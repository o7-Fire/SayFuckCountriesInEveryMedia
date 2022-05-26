#include <time.h>

#include <concord/discord.h>

#define bufferLength 255

FILE* file;
char buffer[bufferLength];

void delay(int seconds)
{
    int mili_seconds = 3000 * seconds;
    clock_t start_time = clock();
    while (clock() < start_time + mili_seconds)
    ;
}
 
void on_ready(struct discord *client) {
  const struct discord_user *bot = discord_get_self(client);
  log_info("Logged in as %s!", bot->username);
}
 
void on_message(struct discord *client, const struct discord_message *msg) {
  if (strcmp(msg->content, "Fuck") != 0)
    return; 
    
  file = fopen("countries.txt", "r");
  while(fgets(buffer, bufferLength, file)) {
    struct discord_create_message params = { .content = buffer };
    discord_create_message(client, msg->channel_id, &params, NULL);
    delay(3);
  }

  fclose(file);

}

 
int main(void) {
  struct discord *client = discord_init("TOKEN");
  discord_set_on_ready(client, &on_ready);
  discord_set_on_message_create(client, &on_message);
  discord_run(client);
}
