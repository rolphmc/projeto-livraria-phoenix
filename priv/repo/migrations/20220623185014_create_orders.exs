defmodule LivrariaPhoenix.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :total_price, :float
      add :its_a_gift, :boolean, default: false, null: false

      timestamps()
    end
  end
end
