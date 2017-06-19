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

```
{:ok, single_pid} = ExExponentialSmoothing.Single.start_link(0.4) # signal_mixing
{:ok, double_pid} = ExExponentialSmoothing.Double.start_link(0.4, 0.4) # signal_mixing, trend_mixing
```

If you don't pass any arguments to `Single.start_link/1` or `Double.start_link/2`, `signal_mixing` default value will be `0.3`, and `double_mixing` default value will be `0.3`.

## API

* ExExponentialSmoothing.Single
    * calculate_signal/2
    * predict_next/1
* ExExponentialSmoothing.Double
    * calculate_signal/2
    * predict_next/1
    * current_trend/1

## TODO

* Documentation.
* Holt Winter.
