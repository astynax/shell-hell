bin/cw: src/cw.cr
	@shards build && \
	strip bin/cw

.PHONY: clean
clean: bin/cw
	@rm bin/cw{,.dwarf}
