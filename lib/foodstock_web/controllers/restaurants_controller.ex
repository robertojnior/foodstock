defmodule FoodstockWeb.RestaurantsController do
  use FoodstockWeb, :controller

  alias Foodstock.Restaurant

  alias FoodstockWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Foodstock.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
