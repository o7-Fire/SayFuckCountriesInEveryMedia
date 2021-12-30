const { Client, Intents } = require('discord.js');
const fs = require('fs');
const readline = require('readline');

client.on('message', message => {
    if (message.content === '+ping') {  
        const fileStream = fs.createReadStream('countries.txt');
        const rl = readline.createInterface({ input: fileStream });
        rl.on('line', line => {
            message.channel.send('Fuck' + line);
        });
    }
});

client.login('TOKEN');
