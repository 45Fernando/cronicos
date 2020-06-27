defmodule Cronicos.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password_hash, :string
      add :name, :string
      add :dni, :string
      add :role, :string
      add :plan, :string
      add :observation, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
