# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :foodstock,
  ecto_repos: [Foodstock.Repo]

config :foodstock, Foodstock.Repo,
  migration_primary_key: [type: :binary_id],
  foreign_key: [type: :binary_id]

# Configures the endpoint
config :foodstock, FoodstockWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FTRHESW1bYKsfKnkH0ESvcGi+ASV8ArpSNSpqb4kr0vg1vX5rTcBHxf/FyInx4sk",
  render_errors: [view: FoodstockWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Foodstock.PubSub,
  live_view: [signing_salt: "muP+DvIl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
