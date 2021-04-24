defmodule FoodstockWeb.RestaurantsViewTest do
  use FoodstockWeb.ConnCase, async: true

  import Phoenix.View

  alias Foodstock.Restaurant
  alias FoodstockWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{"name" => "Balde de Lixo", "email" => "contato@baldedelixo.com"}

      {:ok, restaurant} = Foodstock.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %Restaurant{
               id: _id,
               name: "Balde de Lixo",
               email: "contato@baldedelixo.com"
             } = response
    end
  end
end
