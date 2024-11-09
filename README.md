# Shell Hell 🙃

## What is it

One day I was thinking about a simple task: make a script-like program with proper CLI and pack it into a standalone executable. There was no particular need in the program itself, I just wanted to research as many ways to do it as possible — am I a language geek or not? 😜

Here I'm collecting examples made using stacks I tried so far. Below will be a complete list.

But first let's see the task's conditions.

### Task

1. Each program should be standalone, i.e. "download and run". Ideally, a single binary executable. Here I'm testing the **packaging**.
2. Program should have a rich Command Line Interface with inline help & stuff. Here I'm testing the expressiveness of **CLI-building libs/DSLs**.
3. Program should be able to call external programs and let me write such code easily. Here I'm testing the expressiveness of **shell-scripting capabilities**.

Each program expects a single argument — string prefix. Then it should run the pipeline `grep ^PREFIX /usr/share/dict/words | wc -l` that will count each word int dictionary that starts with the prefix. Yes, I usually can do such calculations  programmatically. But I want to be able to **compose existing tools** and wish to do it in a way as much close to bash/zsh/sh, as it possible in each language stack.

## Experiments

| Language                   | Executable size |
|:--------------------------:|:---------------:|
| [Python](./python)         | 10 MB 🫤        |
| [Rust](./rust/)            | 1.1 MB ☺️        |
| [Haskell](./haskell/)      | 4.2 MB 🫣       |
| [Racket](./racket/)        | 56 MB 🙈        |
| [Kotlin/Native](./kotlin/) | 2.6 MB 👌       |
| [Swift](./swift/)          | 1.5 MB ☺️        |

To be continued...
