# ExExponentialSmoothing

**Elixir Exponential Smoothing Implementation.**

## Description

Only Implemented Single Exponential Smoothing & Double Exponential Smoothing.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_exponential_smoothing` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ex_exponential_smoothing, "~> 0.1.0"}]
end
```

In you `config.ex`

```elixir
config :ex_exponential_smoothing, My.Endpoint,
  signal_mixing: 0.3,
  double_mixing: 0.3
```

If you don't set this in your config file, `signal_mixing` default value will be `0.3`, and `double_mixing` default value will be `0.3`.

## API

* ExExponentialSmoothing.Single
    * calculate_signal/1
    * predict_next/0
* ExExponentialSmoothing.Double
    * calculate_signal/1
    * predict_next/0

## TODO

* Documentation.
* Holt Winter.
