let file = "countries.txt"
if let path = Bundle.main.path(forResource: file, ofType: "txt"){
    do {
        let data = try String(contentsOfFile: path, encoding: .utf8)
        let myStrings = data.components(.split { $0.IsNewline })
        let text = myStrings.joined(separator: "\n")
        print("Fuck" + text)
     // sleep(2) i am not install MacOS for this
