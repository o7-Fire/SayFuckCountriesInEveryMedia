// I don't get paid enough to test this

import Sword

let bot = Sword(token: "TOKEN")

bot.on(.messageCreate) { data in
  let msg = data as! Message

  if msg.content == "Fuck" {
    let file = "countries"
    if let path = Bundle.main.path(forResource: file, ofType: "txt"){
    do {
        let data = try String(contentsOfFile: path, encoding: .utf8)
        let myStrings = data.components(.split { $0.IsNewline })
        let text = myStrings.joined(separator: "\n")
        msg.reply(text: text)
  }
}

bot.connect()
