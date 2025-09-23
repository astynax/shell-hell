require "option_parser"
require "process"

module Cw
  VERSION = "0.1.0"

  prefix = ""

  parser = OptionParser.new do |parser|
    parser.banner = "Usage: cw PREFIX"
    parser.on("-h", "--help") do
      puts parser
      exit
    end
    parser.unknown_args do |unknown|
      if unknown.size > 1
        STDERR.puts "Too many arguments"
        exit
      end
      prefix = unknown[0]
    end
  end

  parser.parse

  grep = Process.new "grep", args: ["^" + prefix, "/usr/share/dict/words"], output: Process::Redirect::Pipe
  wc = Process.new "wc", args: ["-l"], input: grep.output, output: STDOUT
  grep.wait
  wc.wait
end
