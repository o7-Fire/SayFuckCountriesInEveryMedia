// noinspection DuplicatedCode
//nodejs 14.x
const axios = require('axios');
const headers = {
    "accept": "*/*",
    "authorization": process.env.TOKEN || "OR YOUR TOKEN",
    "content-type": "application/json",
};

function sleep(ms) {
    return new Promise((resolve) => {
        setTimeout(resolve, ms);
    });
}

function updateCustom(text = "libtard") {
    return axios({
        method: "PATCH",
        url: "https://discord.com/api/v9/users/@me/settings",

        headers: headers,
        data: {
            custom_status: {
                text: text
            }
        }
    });
}

function updateStatus(status = "online") {
    return axios({
        url: "https://discord.com/api/v9/users/@me/settings",
        headers: headers,
        data: {
            status: status
        },
        method: "PATCH",
    })
}

async function getItems() {
    const {data} = await axios.get("http://country.io/names.json")
    const country = []
    for (const id in data) {
        country.push(data[id]);
    }
    return country;
    //console.log(root)
}

async function assad() {
    const items = await getItems();
    console.log("Found:", items.length, "items")
    while (true) {
        await sleep(5000);
        let slur = items[Math.floor(Math.random() * items.length)];
        slur = "Fuck " + slur;
        try {
            console.log("Text:", slur)
            await updateCustom(slur);
        } catch (e) {
            console.error(e);
        }
    }
}


//if(1 === 2)
assad().catch(console.error);
//test().catch(console.error);