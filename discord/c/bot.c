#include <time.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <concord/log.h>
#include <unistd.h>
#include <concord/discord.h>

#define bufferLength 255

FILE* file;
char buffer[bufferLength];


char* FUCKYOU(const char *buffer) {
  char *result = malloc(strlen("Fuck ") + strlen(buffer) + 1);
  strcpy(result, "Fuck ");
  strcat(result, buffer);
  return result;
}
 
void on_ready(struct discord *client, const struct discord_ready *event) {
    log_info("Logged in as %s!", event->user->username);
}
 
void on_message(struct discord *client, const struct discord_message *event) {  
  if (strcmp(event->content, "Fuck") != 0)
    return; 
    
  file = fopen("countries.txt", "r");
  while(fgets(buffer, bufferLength, file)) {
    struct discord_create_message params = { .content = FUCKYOU(buffer) };
    discord_create_message(client, event->channel_id, &params, NULL);
    sleep(3);
  }

  fclose(file);

}

 
int main(void) {
  struct discord *client = discord_init("TOKEN");
  discord_add_intents(client, DISCORD_GATEWAY_MESSAGE_CONTENT);
  discord_set_on_ready(client, &on_ready);
  discord_set_on_message_create(client, &on_message);
  discord_run(client);
}
