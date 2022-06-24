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
  end
end
