defmodule LivrariaPhoenix.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :author_name, :string

      timestamps()
    end

    create unique_index(:authors, [:author_name])
  end
end
