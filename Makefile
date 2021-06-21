.PYONY: link clean
.DEFAULT_GOAL := default

clean:
	(cd callee-rs; cargo clean)
	rm -f callee-c/lib.o
	rm -f callee-as/lib.o

callee-rs/target/wasm32-wasi/release/libcallee_rs.a:
	cd callee-rs && cargo build --release --target wasm32-wasi

callee-c/lib.o:
	cd callee-c && clang --target=wasm32 -nostdlib -Wl,--relocatable -o lib.o lib.c

# NB: [issue](https://github.com/AssemblyScript/assemblyscript/pull/890)
callee-as/lib.o:
	cd callee-as && asc as-lib.ts -o lib.o

link: callee-rs/target/wasm32-wasi/release/libcallee_rs.a callee-c/lib.o callee-as/lib.o
	wasm-ld -o run.wasm callee-rs/target/wasm32-wasi/release/libcallee_rs.a callee-c/lib.o # callee-as/lib.o

default: link
	@echo
	@echo ===== RUNNING RESULT =====:
	@echo
	wasmer run run.wasm
