defmodule Foodstock.Supplies.ExpiringThisWeek do
  import Ecto.Query

  alias Foodstock.{Repo, Restaurant, Supply}

  def call(weekday \\ Date.utc_today()) do
    beginning_of_week = Date.beginning_of_week(weekday)
    end_of_week = Date.end_of_week(weekday)

    query =
      from supply in Supply,
        where:
          supply.expiration_date >= ^beginning_of_week and
            supply.expiration_date <= ^end_of_week,
        preload: [:restaurant]

    query
    |> Repo.all()
    |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)
  end
end
