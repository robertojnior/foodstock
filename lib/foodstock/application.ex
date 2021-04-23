defmodule Foodstock.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Foodstock.Repo,
      # Start the Telemetry supervisor
      FoodstockWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Foodstock.PubSub},
      # Start the Endpoint (http/https)
      FoodstockWeb.Endpoint,
      # Start a worker by calling: Foodstock.Worker.start_link(arg)
      # {Foodstock.Worker, arg}
      Foodstock.Supplies.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Foodstock.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FoodstockWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
