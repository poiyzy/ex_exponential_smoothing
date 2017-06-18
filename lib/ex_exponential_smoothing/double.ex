defmodule ExExponentialSmoothing.Double do
  use GenServer

  def start_link(signal_mixing, trend_mixing) do
    GenServer.start_link(__MODULE__, {signal_mixing, trend_mixing, nil, 0}, name: :es_double_server)
  end

  def calculate_signal(value) do
    GenServer.call(:es_double_server, {:new_comming_data, value})
  end

  def predict_next do
    GenServer.call(:es_double_server, :predict_next)
  end

  def init({signal_mixing, trend_mixing, last_signal, last_trend}) do
    {:ok, {signal_mixing, trend_mixing, last_signal, last_trend}}
  end

  def handle_call({:new_comming_data, cur}, _, {signal_mixing, trend_mixing, last_signal, last_trend}) do
    cur_signal = calculate_signal(cur, last_signal, signal_mixing, last_trend)
    cur_trend = calculate_trend(trend_mixing, cur_signal, last_signal, last_trend)

    {
      :reply,
      cur_signal,
      {signal_mixing, trend_mixing, cur_signal, cur_trend}
    }
  end

  def handle_call(:predict_next, _, {signal_mixing, trend_mixing, last_signal, last_trend}) do
    {
      :reply,
      predict_next(last_signal, last_trend),
      {signal_mixing, trend_mixing, last_signal, last_trend}
    }
  end

  defp calculate_signal(cur, nil, _, _) do
    cur
  end

  defp calculate_signal(cur, last_signal, signal_mixing, last_trend) do
    signal_mixing * cur + (1 - signal_mixing) * (last_signal + last_trend)
  end

  defp calculate_trend(_, nil, _, _) do
    0
  end

  defp calculate_trend(_, _, nil, _) do
    0
  end

  defp calculate_trend(trend_mixing, cur_signal, last_signal, last_trend) do
    trend_mixing * (cur_signal - last_signal) + (1 - trend_mixing) * last_trend
  end

  defp predict_next(last_signal, last_trend) do
    last_signal + last_trend
  end
end
