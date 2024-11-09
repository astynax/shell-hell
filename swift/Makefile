.PHONY: debug release clean

debug: .build/debug/cw

release: .build/release/cw

clean:
	swift package clean

.build/debug/cw: Package.swift Sources/cw.swift
	swift build

.build/release/cw: Package.swift Sources/cw.swift
	swift build -c release
