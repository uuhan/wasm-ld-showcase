### Dependencies

- **rustup** rust toolchain with `wasm32-wasi` target installed

- **llvm&clang** tested version: 12.0.0

- **assemblyscript** npm install -g assemblyscript

- [wasmer](https://github.com/wasmerio/wasmer) runner

### Run

```sh
make

# output:
# ===== RUNNING RESULT =====:

# wasmer run run.wasm
# [C] 3 + 4 = 7
```

### Issue

Assemblyscript's relocatable module support is WIP:

[draft#890](https://github.com/AssemblyScript/assemblyscript/pull/890) last updated on 26 May 2020
