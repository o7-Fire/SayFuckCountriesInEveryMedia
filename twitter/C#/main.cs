using CoreTweet;

var session = OAuth.Authorize("consumer_key", "consumer_secret");
var tokens = OAuth.GetTokens(session, "PINCODE");


const string Path = @"countries.txt";
string[] lines = File.ReadAllLines(path: Path);
foreach (string line in lines)
    tokens.Statuses.Update(status => "Fuck" + line);
