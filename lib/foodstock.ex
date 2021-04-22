defmodule Foodstock do
  @moduledoc """
  Foodstock keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Foodstock.Restaurants.Create, as: CreateRestaurant

  alias Foodstock.Supplies.Create, as: CreateSupply
  alias Foodstock.Supplies.FindOne, as: FindOneSupply

  defdelegate create_restaurant(params), to: CreateRestaurant, as: :call

  defdelegate find_supply(params), to: FindOneSupply, as: :call
  defdelegate create_supply(params), to: CreateSupply, as: :call
end
