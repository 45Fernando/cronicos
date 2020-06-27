defmodule Cronicos.Medicamentos.Medicamento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "medicamentos" do
    field :drogas, :string
    field :nombre, :string
    field :presentacion, :string

    timestamps()
  end

  @doc false
  def changeset(medicamento, attrs) do
    medicamento
    |> cast(attrs, [:nombre, :drogas, :presentacion])
    |> validate_required([:nombre, :drogas, :presentacion])
  end
end
