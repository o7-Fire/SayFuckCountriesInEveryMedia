use std::fs::File;
use std::io;
use std::io::BufRead;
use std::path::Path;

fn main() {
    let countries: Vec<String>;
    if let Ok(lines) = read_lines("../../countries.txt") {
        countries = lines.map(|line| line.unwrap()).collect::<Vec<String>>();
    } else if let Ok(lines) = read_lines("countries.txt") {
        countries = lines.map(|line| line.unwrap()).collect::<Vec<String>>();
    } else {
        panic!("countries.txt not found");
    }
    loop {
        for country in &countries {
            println!("Fuck {}", country);
        }
    }
}

// The output is wrapped in a Result to allow matching on errors
// Returns an Iterator to the Reader of the lines of the file.
fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
    where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}