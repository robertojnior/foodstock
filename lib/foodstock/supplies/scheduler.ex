defmodule Foodstock.Supplies.Scheduler do
  use GenServer

  alias Foodstock.Supplies.ExpirationNotification

  @ten_seconds 10_000

  # Client

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Server (callbacks)

  @impl true
  def init(state \\ %{}) do
    schedule_notification()

    {:ok, state}
  end

  # Receives any message from any process
  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.deliver()

    schedule_notification()

    {:noreply, state}
  end

  # Sync
  @impl true
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  # Async
  @impl true
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  defp schedule_notification do
    Process.send_after(self(), :generate, @ten_seconds)
  end
end
