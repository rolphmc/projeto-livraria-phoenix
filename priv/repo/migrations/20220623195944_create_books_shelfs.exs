defmodule LivrariaPhoenix.Repo.Migrations.CreateBooksShelfs do
  use Ecto.Migration

  def change do
    create table(:books_shelfs) do
      add :book_id, references(:books)
      add :shelf_id, references(:shelfs)
    end

    create unique_index(:books_shelfs, [:book_id, :shelf_id])
  end
end
