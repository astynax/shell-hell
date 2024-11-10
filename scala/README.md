# CountWords: the Scala version

I used the [Scala-CLI](https://scala-cli.virtuslab.org) to run the interpreted version and to build the final executable using the GraalVM. I tried to make a binary with Scala Native but my combination of the toolchain, compiler & libs doesn't want to play well 😅

## Used libraries

- [com-lihaoyi / mainargs](https://index.scala-lang.org/com-lihaoyi/mainargs) for the argument parsing. This one is fine but it forces me to make an object for any app and it is a bummer — I just wanted to stay with Scala-CLI scripts with its bare top-level calls 😭
- [com-lihaoyi / os-lib](https://index.scala-lang.org/com-lihaoyi/os-lib) for working with  subprocesses. Jumped around it a lot but didn't get a non-hanging version of the pipeline made using the `os.proc()`+`.pipeTo` sugar. Current version uses the manual stream plumbing but it works as I need.
