defmodule Cronicos.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    field :name, :string
    field :dni, :string
    field :role, :string, default: "user"
    field :plan, :string
    field :observation, :string

    pow_user_fields()

    has_many(:pedidos, Cronicos.Pedidos.Pedido, foreign_key: :user_id)

    timestamps()
  end

  @attrs_cast ~w(name dni plan observation)a
  @attrs_cast_require ~w(name dni)a

  @attrs_cast_auditor ~w(name dni plan observation)a
  @attrs_cast_require_auditor ~w(name dni)a

  def changeset(user, attrs) do
    user
    |> pow_changeset(attrs)
    |> Ecto.Changeset.cast(attrs, @attrs_cast)
    |> Ecto.Changeset.validate_required(@attrs_cast_require)
  end


  #Este changeset es para crear o editar usuarios desde el rol auditor
  def changeset_auditor(user, attrs) do
    user
    |> Ecto.Changeset.cast(attrs, @attrs_cast_auditor)
    |> Ecto.Changeset.validate_required(@attrs_cast_require_auditor)
  end

  def changeset_role(user, attrs) do
    user
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(expendedor auditor admin))
  end
end
