# Count Words: the Swift version

## Used packages

- [swift-argument-parser](https://swiftpackageindex.com/apple/swift-argument-parser/) — a Go-To package from CLI tools
- [SwiftShell](https://swiftpackageindex.com/kareman/SwiftShell) — a shell-scripting package with lazy streams and stuff.

## How To

- `make` and then run `./.build/debug/cw`
- `make release` and then run `./build/release/cs`

## Gotchas

- Ideally I should catch errors from the pipeline but in simple scenarios it's OK to fail on the first error
- In this example I'm just printing the whole `stdout` after the pipeline's completion. Ideally, I should use `pipeline.stdout.onOutput` and print chunk by chunk. But when output is small it is OK to keep the code "quick & dirty".
