defmodule FoodstockWeb.RestaurantsView do
  use FoodstockWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    restaurant
  end
end
