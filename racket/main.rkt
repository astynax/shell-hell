#lang rash

(require racket/cmdline)

(define pattern
  (string-append
    "^"
    (command-line
      #:args
      (str) str)))

grep pattern /usr/share/dict/words | wc -l

