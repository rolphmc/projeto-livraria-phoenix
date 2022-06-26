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

    create unique_index(:username, [:username])
    create unique_index(:email, [:email])
  end
end
