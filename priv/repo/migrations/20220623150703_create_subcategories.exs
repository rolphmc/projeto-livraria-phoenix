defmodule LivrariaPhoenix.Repo.Migrations.CreateSubcategories do
  use Ecto.Migration

  def change do
    create table(:subcategories) do
      add :subcategory, :string
      add :category_id, references(:categories)

      timestamps()
    end

    create unique_index(:subcategories, [:subcategory])
  end
end
