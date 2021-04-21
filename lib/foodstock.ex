defmodule Foodstock do
  @moduledoc """
  Foodstock keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Foodstock.Restaurants.Create, as: CreateRestaurant

  defdelegate create_restaurant(params), to: CreateRestaurant, as: :call
end
