defmodule Cronicos.Pedidos.Pedido do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pedidos" do
    belongs_to(:users, Cronicos.Users.User, foreign_key: :user_id, on_replace: :raise)
    belongs_to(:medicamentos, Cronicos.Medicamentos.Medicamento, foreign_key: :medicamento_id, on_replace: :raise)

    field :retirado, :boolean, default: false
    field :posologia, :string
    field :porcentaje, :string


    timestamps()
  end

  @attrs_cast ~w(user_id medicamento_id retirado posologia porcentaje)a
  @attrs_cast_require ~w(user_id medicamento_id retirado posologia porcentaje)a

  @doc false
  def changeset(medicamento, attrs) do
    medicamento
    |> cast(attrs, @attrs_cast)
    |> validate_required(@attrs_cast_require)
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:medicamento_id)
  end
end
