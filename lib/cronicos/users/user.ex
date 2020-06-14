defmodule Cronicos.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    field :name, :string
    field :dni, :string
    field :role, :string
    field :plan, :string
    field :observation, :string, default: "user"

    pow_user_fields()

    timestamps()
  end

  @attrs_cast ~w(name dni plan observation)a
  @attrs_cast_require ~w(name dni)a

  def changeset(user, attrs) do
    user
    |> pow_changeset(attrs)
    |> Ecto.Changeset.cast(attrs, @attrs_cast)
    |> Ecto.Changeset.validate_required(@attrs_cast_require)
  end

  def changeset_role(user, attrs) do
    user
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(user admin))
  end
end
