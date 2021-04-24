defmodule Foodstock.RestaurantTest do
  use Foodstock.DataCase, async: true

  alias Ecto.Changeset
  alias Foodstock.Restaurant

  describe "changeset/1" do
    test "when the required fields are present and valid, returns an valid changeset" do
      params = %{"name" => "Balde de Lixo", "email" => "contato@baldedelixo.com"}

      changeset = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{email: "contato@baldedelixo.com", name: "Balde de Lixo"},
               valid?: true
             } = changeset
    end

    test "when the required fields are present but invalid, returns an invalid changeset" do
      params = %{"name" => "B", "email" => "contato@.com"}

      expected_errors = %{
        name: ["should be at least 2 character(s)"],
        email: ["has invalid format"]
      }

      changeset = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = changeset
      assert errors_on(changeset) == expected_errors
    end
  end
end
