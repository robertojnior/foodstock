defmodule Foodstock.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Foodstock.Supply

  def new(email, supplies) do
    new_email(
      to: email,
      from: "noreply@food.stock",
      subject: "Supplies expiring this week",
      text_body: text_body(supplies)
    )
  end

  defp text_body(supplies) do
    message_text = "Supplies that are about to expire:\n\n"

    supplies
    |> Enum.reduce(message_text, fn supply, text -> text <> supply_to_s(supply) end)
  end

  defp supply_to_s(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}\n" <>
      "Responsible: #{responsible}\n" <>
      "Expiration date: #{expiration_date}\n" <>
      "-------------------------------------\n"
  end
end
