defmodule FoodstockWeb.SuppliesController do
  use FoodstockWeb, :controller

  alias Foodstock.Supply

  alias FoodstockWeb.FallbackController

  action_fallback FallbackController

  def show(conn, %{"id" => id}) do
    with {:ok, %Supply{} = supply} <- Foodstock.find_supply(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Foodstock.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end
end
