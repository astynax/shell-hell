import com.github.ajalt.clikt.core.CliktCommand
import com.github.ajalt.clikt.core.main
import com.github.ajalt.clikt.parameters.arguments.*

object Main : CliktCommand() {
  private val prefix by argument().help("A word prefix").validate {
    require(it.all { c -> c in 'a'..'z' }) {
      "Prefix can contain only latin letters"
    }
  }

  override fun run() {
    platform.posix.system(
      "grep ^$prefix /usr/share/dict/words | wc -l"
    )
  }
}

fun main(args: Array<String>) = Main.main(args)
