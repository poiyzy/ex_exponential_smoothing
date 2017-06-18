defmodule ExExponentialSmoothing do
  @moduledoc """
  Documentation for ExExponentialSmoothing.
  """

  use Supervisor

  alias ExExponentialSmoothing.Single
  alias ExExponentialSmoothing.Double

  @doc """
  Hello world.

  ## Examples

      iex> ExExponentialSmoothing.hello
      :world

  """
  def start(_, [signal_mixing, trend_mixing]) do
    Single.start_link(signal_mixing)
    Double.start_link(signal_mixing, trend_mixing)
  end
end
