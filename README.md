# CONST

An interpreter in Elm for evaluating constants, i.e. non-negative integers.

## Usage

```bash
$ nix develop
$ elm repl

> import CONST.Interpreter as I
> I.run "123"
Ok (VNumber 123) : Result I.Error I.Value
```
