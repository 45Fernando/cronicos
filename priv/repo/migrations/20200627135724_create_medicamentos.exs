defmodule Cronicos.Repo.Migrations.CreateMedicamentos do
  use Ecto.Migration

  def change do
    create table(:medicamentos) do
      add :nombre, :string
      add :drogas, :string
      add :presentacion, :string

      timestamps()
    end

  end
end
