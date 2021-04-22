defmodule Foodstock.Repo.Migrations.CreateSupplies do
  use Ecto.Migration

  def change do
    create table :supplies do
      add :restaurant_id, references(:restaurants, type: :binary_id)

      add :description, :string
      add :responsible, :string

      add :expiration_date, :date

      timestamps()
    end
  end
end
