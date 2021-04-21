defmodule Foodstock.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add :name, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:restaurants, [:email])
  end
end
