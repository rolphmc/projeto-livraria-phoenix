defmodule LivrariaPhoenix.Repo.Migrations.CreateShelfs do
  use Ecto.Migration

  def change do
    create table(:shelfs) do
      add :customer_id, references(:customers)
      timestamps()
    end
  end
end
