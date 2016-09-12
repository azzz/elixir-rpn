# Rvn

This is my "hello world" application in Elixir. The application implements Reverse Polish Notation in Elixir.

## API

Just run `iex -S mix` and play with the app:

```
iex> Rvn.calc("2 3 +")
5

iex> Rvn.calc("60 3 3 + / 5 *")
50.0
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `rvn` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:rvn, "~> 0.1.0"}]
    end
    ```

  2. Ensure `rvn` is started before your application:

    ```elixir
    def application do
      [applications: [:rvn]]
    end
    ```
