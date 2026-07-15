# CONST

A tiny interpreter in Elm that evaluates non-negative integer constants.

Read [CONST: The Structure of a Tiny Interpreter in Elm](https://blog.tinyinterpreters.dev/posts/const) for a guided explanation of how it works.

```mermaid
flowchart TD
    A["123"] -->|parse| B["Program (Const 123)"]
    B -->|runProgram| C["VNumber 123"]
```

## Run it

You’ll need [Nix](https://nixos.org/) with flakes enabled.

```bash
nix develop
elm repl
```

Then, in the Elm REPL:

```elm
import CONST.Interpreter as I

I.run "123"
-- Ok (VNumber 123)
```
