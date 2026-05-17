package cw

import "core:fmt"
import "core:flags"
import "core:os"

Args :: struct {
    prefix: string `args:"pos=0,required"`,
}

main :: proc() {
    args := new(Args)
    flags.parse_or_exit(args, os.args, style = .Unix)

    r, w, err := os.pipe()
    if err != nil {
        fmt.eprintf("pipe failed")
        return
    }
    defer if r != nil { os.close(r) }
    defer if w != nil { os.close(w) }

    pd_grep := os.Process_Desc{
        command = []string{
            "grep", fmt.aprintf("^{}", args.prefix), "/usr/share/dict/words"
        },
        stdout = w,
    }

    pd_wc := os.Process_Desc{
        command = []string{"wc", "-l"},
        stdin = r,
        stdout = os.stdout,
    }

    p_grep: os.Process
    p_grep, err = os.process_start(pd_grep)
    if err != nil {
        fmt.eprintf("failed to start grep")
        os.exit(1)
    }

    p_wc: os.Process
    p_wc, err = os.process_start(pd_wc)
    if err != nil {
        fmt.eprintf("failed to start wc")
        os.exit(2)
    }

    os.close(w)
    w = nil
    os.close(r)
    r = nil

    _, _ = os.process_wait(p_grep)
    _, _ = os.process_wait(p_wc)
}
