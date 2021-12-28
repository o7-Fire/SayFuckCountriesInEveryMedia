use std::fs::File;
use std::fs;
use std::io;
use std::ffi::c_void;
use std::io::{BufRead, Read, Write};
use std::path::Path;
use rand::Rng;
use reqwest;
use reqwest::header::HeaderMap;
use rpassword::read_password;

const URL: &str = "https://ptb.discord.com/api/v9/users/@me/settings";
const CONTENT: &str = "{\"custom_status\":{\"text\":\"REPLACETHIS\"}}";
fn main() {
    //read input
    print!("Enter your token: ");
    std::io::stdout().flush().unwrap();
    let token = read_password().unwrap();
    if token.len() < 25 {
        println!("Please enter a valid token");
        return;
    }
    //read file
    let mut countries: Vec<String>;
    if let Ok(lines) = read_lines("../../countries.txt"){
        countries = lines.map(|line| line.unwrap()).collect::<Vec<String>>();
    } else if let Ok(lines) = read_lines("countries.txt"){
        countries = lines.map(|line| line.unwrap()).collect::<Vec<String>>();
    } else {
        panic!("countries.txt not found");
    }
    println!("Loaded {} countries", countries.len());
    println!("Content {}", CONTENT);
    loop {
        for country in &countries {
            let str = "Fuck ".to_string() + country;
            request(str, token.clone());
            //sleep for 2-3 seconds
            let sleep_time = rand::thread_rng().gen_range(2..4);
            std::thread::sleep(std::time::Duration::from_secs(sleep_time));
        }
    }

}

//http patch request
fn request(text: String, token: String) {

    let client = reqwest::blocking::Client::new();
    let res = client.patch(URL)
        .header(reqwest::header::CONTENT_TYPE, "application/json")
        .header(reqwest::header::AUTHORIZATION, token)
        .header(reqwest::header::USER_AGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36")
        .body(CONTENT.clone().replace("REPLACETHIS", &text))
        .send().unwrap();
    println!("{} Fuck: {:?}", res.status(), text);
}

// The output is wrapped in a Result to allow matching on errors
// Returns an Iterator to the Reader of the lines of the file.
fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
    where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}
