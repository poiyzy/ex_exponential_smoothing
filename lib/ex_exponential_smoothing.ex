defmodule ExExponentialSmoothing do
  @moduledoc """
  Documentation for ExExponentialSmoothing.
  """

  alias ExExponentialSmoothing.Single
  alias ExExponentialSmoothing.Double

  @signal_mixing Application.get_env(:ex_exponential_smoothing, :signal_mixing) || 0.3
  @trend_mixing Application.get_env(:ex_exponential_smoothing, :trend_mixing) || 0.3

  @doc """
  Hello world.

  ## Examples

      iex> ExExponentialSmoothing.hello
      :world

  """
  def start(_, _) do
    Single.start_link(@signal_mixing)
    Double.start_link(@signal_mixing, @trend_mixing)
  end
end
