defmodule Foodstock.Repo do
  use Ecto.Repo,
    otp_app: :foodstock,
    adapter: Ecto.Adapters.Postgres
end
