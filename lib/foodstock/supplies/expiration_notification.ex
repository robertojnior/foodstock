defmodule Foodstock.Supplies.ExpirationNotification do
  alias Foodstock.Mailer

  alias Foodstock.Supplies.ExpirationEmail
  alias Foodstock.Supplies.ExpiringThisWeek, as: SuppliesExpiringThisWeek

  def deliver do
    SuppliesExpiringThisWeek.call()
    |> Task.async_stream(fn {email, supplies} -> send_email(email, supplies) end)
    |> Stream.run()
  end

  defp send_email(email, supplies) do
    email
    |> ExpirationEmail.new(supplies)
    |> Mailer.deliver_later!()
  end
end
