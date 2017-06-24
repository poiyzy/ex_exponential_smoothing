defmodule ExExponentialSmoothing.Single do
  use GenServer

  def start_link(signal_mixing \\ 0.3) do
    GenServer.start_link(__MODULE__, signal_mixing)
  end

  def calculate_signal(pid, value) do
    GenServer.call(pid, {:new_comming_data, value})
  end

  def current_signal(pid) do
    GenServer.call(pid, :get_current_signal)
  end

  def predict_next(pid) do
    GenServer.call(pid, :predict_next)
  end

  def init(signal_mixing) do
    {:ok, {signal_mixing, nil}}
  end

  def handle_call({:new_comming_data, cur}, _, {signal_mixing, last_signal}) do
    cur_signal = calculate_signal(cur, last_signal, signal_mixing)

    {
      :reply,
      cur_signal,
      {signal_mixing, cur_signal}
    }
  end

  def handle_call(:get_current_signal, _, {signal_mixing, last_signal}) do
    {
      :reply,
      last_signal,
      {signal_mixing, last_signal}
    }
  end

  def handle_call(:predict_next, _, {signal_mixing, last_signal}) do
    {
      :reply,
      predict_next_value(last_signal),
      {signal_mixing, last_signal}
    }
  end

  defp calculate_signal(cur, nil, _) do
    cur
  end

  defp calculate_signal(cur, last_signal, signal_mixing) do
    signal_mixing * cur + (1 - signal_mixing) * last_signal
  end

  defp predict_next_value(last_signal) do
    last_signal
  end
end
