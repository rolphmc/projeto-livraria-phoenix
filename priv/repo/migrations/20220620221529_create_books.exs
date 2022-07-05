defmodule LivrariaPhoenix.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :description, :string
      add :image, :string
      add :price, :float
      add :title, :string
      add :author_id, references(:authors)

      timestamps()
    end

    create unique_index(:books, [:title])
  end
end
