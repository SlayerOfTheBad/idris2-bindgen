# idris2-bingen
A C-FFI binding generator, to remove the tedium of writing boilerplate.

## Task List
- [x] Generate enum wrappers
  - [x] Parse enums
  - [x] Generate enums
- [ ] Generate structs wrappers
  - [ ] Parse structs
  - [ ] Generate structs
- [ ] Generate functions wrappers
  - [ ] Parse function signatures
  - [ ] Generate function signatures
- [ ] Investigate possibility for generating unions
  - Not really an equivalent available in Idris2
  - Often used to make "data types" using unions in structs. Maybe automatically possible?
- [ ] Input handling
  - [ ] Sensible defaults
  - [ ] Parsing that can fail on incomplete input
- [ ] Proper bootstrapping
  - [ ] Add parser from the output of `clang -Xclang -dump-ast=json` to `Parser.Common.AST`
  - [ ] Compile `bootstrap-bindgen` using the JSON parser
  - [ ] Use `bootstrap-bindgen` to generate the bindings for `Parser.Native`
  - [ ] Compile `idris2-bindgen` with `Parser.Native`
