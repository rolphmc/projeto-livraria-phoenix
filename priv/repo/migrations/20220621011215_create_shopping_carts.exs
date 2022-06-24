defmodule LivrariaPhoenix.Repo.Migrations.CreateShoppingCarts do
  use Ecto.Migration

  def change do
    create table(:shopping_carts) do
      add :quantity, :integer
      add :total_price, :float
      add :customer_id, references(:customers)
      add :book_id, references(:books, on_update: :update_all)

      timestamps()
    end

    create unique_index(:shopping_carts, [:book_id, :customer_id])
  end
end
