from plumbum import FG
from plumbum.cmd import grep, wc
import click


@click.command()
@click.argument('word', type=str, required=True)
def main(word):
    (grep["^" + word, "/usr/share/dict/words"]
     | wc["-l"]
     ) & FG


if __name__ == '__main__':
    main()
