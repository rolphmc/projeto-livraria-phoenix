defmodule LivrariaPhoenix.Repo.Migrations.CreateSubcategoriesBooks do
  use Ecto.Migration

  def change do
    create table(:categories_books) do
      add :subcategory_id, references(:subcategories)
      add :book_id, references(:books)
    end

    create unique_index(:categories_books, [:subcategory_id, :book_id])
  end
end
