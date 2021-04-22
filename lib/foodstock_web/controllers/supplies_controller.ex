defmodule FoodstockWeb.SuppliesController do
  use FoodstockWeb, :controller

  alias Foodstock.Supply

  alias FoodstockWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Foodstock.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end
end
