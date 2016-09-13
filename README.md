# RPN(Reverse Polish Notation)

This is my "hello world" application in Elixir. The application implements Reverse Polish Notation in Elixir.

## Usage

The module implements following operators:
- Basic: `+`, `-`, `*`, `/`
- Raise to power: `^` (`2 3 ^` raises 2 to 3)

Just run `iex -S mix` and play with the app:

```
iex> Rpn.calc("2 3 +")
5

iex> Rpn.calc("60 3 3 + / 5 *")
50.0
```
