//> using scala 3.5.1

//> using dep com.lihaoyi::os-lib:0.11.3
//> using dep com.lihaoyi::mainargs:0.7.6

import mainargs.{main, arg, ParserForMethods, Flag}

object CW {
  @main
  def run(
    @arg(doc = "A prefix to count words starting with it", positional = true)
    prefix: String
  ) = {
    val grep = os.spawn(cmd = ("grep", "^" + prefix, "/usr/share/dict/words"))
    val wc = os.spawn(cmd = ("wc", "-l"), stdin = grep.stdout, stdout = os.Inherit)
  }

  def main(args: Array[String]): Unit = ParserForMethods(this).runOrExit(args)
}
