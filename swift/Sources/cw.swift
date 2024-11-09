import ArgumentParser
import SwiftShell

@main
struct cw: ParsableCommand {
    @Argument(help: "A prefix to search")
    var prefix: String

    mutating func run() throws {
        let pipeline = runAsync("grep", "^\(prefix)", "/usr/share/dict/words")
          .stdout.runAsync("wc", "-l")

        try pipeline.finish()

        // the output is expected to be small
        // so it's ok to read it all at once later
        print(pipeline.stdout.read())
    }
}
