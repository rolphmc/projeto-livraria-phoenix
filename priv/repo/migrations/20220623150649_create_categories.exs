defmodule LivrariaPhoenix.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :category, :string

      timestamps()
    end

    create unique_index(:categories, [:category])
  end
end
