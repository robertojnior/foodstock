defmodule FoodstockWeb.RestaurantsControllerTest do
  use FoodstockWeb.ConnCase, async: true

  describe "create/2" do
    test "when the params are valid, creates the restaurant", %{conn: conn} do
      params = %{"name" => "Balde de Lixo", "email" => "contato@baldedelixo.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "id" => _id,
               "name" => "Balde de Lixo",
               "email" => "contato@baldedelixo.com"
             } = response
    end

    test "when the params are invalid, return errors", %{conn: conn} do
      params = %{"name" => "", "email" => ""}

      expected_errors = %{
        "errors" => %{"email" => ["can't be blank"], "name" => ["can't be blank"]}
      }

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_errors
    end
  end
end
