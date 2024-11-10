.PHONY try build

try:
	scala-cli cw.scala -- re

build: cw

cw: cw.scala
	scala-cli --power package --graal cw.scala --force -o cw
