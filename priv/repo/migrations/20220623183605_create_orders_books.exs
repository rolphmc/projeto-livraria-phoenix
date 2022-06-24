defmodule LivrariaPhoenix.Repo.Migrations.CreateOrdersBooks do
  use Ecto.Migration

  def change do
    create table(:orders_books) do
      add :quantity, :integer
      add :total_price, :float
      add :order_id, references(:orders)
      add :book_id, references(:books)
    end

    create unique_index(:orders_books, [:order_id, :book_id])
  end
end
