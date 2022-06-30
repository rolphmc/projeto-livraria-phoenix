defmodule LivrariaPhoenix.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :username, :string
      add :name, :string
      add :email, :string
      add :encrypted_password, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:customers, [:username])
    create unique_index(:customers, [:email])
  end
end
