defmodule Foodstock.Restaurant do
  use Ecto.Schema

  import Ecto.Changeset

  alias Foodstock.Supply

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields [:name, :email]

  @derive {Jason.Encoder, only: [:id] ++ @required_fields}

  @email_regex ~r/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  schema "restaurants" do
    field :name, :string
    field :email, :string

    has_many :supplies, Supply

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, @email_regex)
    |> unique_constraint([:email])
  end
end
