defmodule LivrariaPhoenix.Repo.Migrations.CreateCategoriesBooks do
  use Ecto.Migration

  def change do
    create table(:categories_books) do
      add :subcategory_id, references(:subcategories, on_delete: :delete_all, primary_key: true)
      add :book_id, references(:books, on_delete: :delete_all, primary_key: true)
    end

    create(index(:categories_books, [:subcategory_id]))
    create(index(:categories_books, [:book_id]))
    create unique_index(:categories_books, [:subcategory_id, :book_id], name: :subcategory_id_book_id_unique_index)
  end
end
