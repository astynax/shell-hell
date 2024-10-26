use clap::command;
use clap::Parser;
use duct::cmd;

#[derive(Parser)]
#[command()]
struct Cli {
    word: String,
}

fn main() {
    let cli = Cli::parse();

    cmd!("grep", "^".to_string() + &cli.word, "/usr/share/dict/words")
        .pipe(cmd!("wc", "-l"))
        .run()
        .unwrap();
}
