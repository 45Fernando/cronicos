defmodule Cronicos.Repo.Migrations.CreatePedidosTable do
  use Ecto.Migration

  def change do
    create table(:pedidos) do
      add :user_id, references :users
      add :medicamento_id, references :medicamentos
      add :retirado, :boolean, default: false
      add :posologia, :string
      add :porcentaje, :string


      timestamps()
    end

    create(index(:pedidos, [:medicamento_id]))
    create(index(:pedidos, [:user_id]))
  end
end
