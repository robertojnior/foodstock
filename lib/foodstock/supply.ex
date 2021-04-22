defmodule Foodstock.Supply do
  use Ecto.Schema

  import Ecto.Changeset

  alias Foodstock.Restaurant

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  @required_fields [:restaurant_id, :description, :responsible, :expiration_date]

  @derive {Jason.Encoder, only: [:id] ++ @required_fields}

  schema "supplies" do
    field :description, :string
    field :responsible, :string

    field :expiration_date, :date

    belongs_to :restaurant, Restaurant

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:description, min: 3)
    |> validate_length(:responsible, min: 3)
  end
end
