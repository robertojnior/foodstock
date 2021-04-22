defmodule FoodstockWeb.SuppliesView do
  use FoodstockWeb, :view

  def render("create.json", %{supply: supply}) do
    supply
  end
end
