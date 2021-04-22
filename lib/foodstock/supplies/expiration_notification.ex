defmodule Foodstock.Supplies.ExpirationNotification do
  alias Foodstock.Mailer

  alias Foodstock.Supplies.ExpirationEmail
  alias Foodstock.Supplies.ExpiringThisWeek, as: SuppliesExpiringThisWeek

  def deliver do
    restaurant_supplies = SuppliesExpiringThisWeek.call()

    Enum.each(restaurant_supplies, fn {restaurant_mail, supplies} ->
      restaurant_mail
      |> ExpirationEmail.new(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end
