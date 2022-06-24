defmodule LivrariaPhoenix.Sales.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias LivrariaPhoenix.Books.Book
  alias LivrariaPhoenix.Customers.Customer

  @fields [:its_a_gift, :total_price, :customer_id]

  schema "orders" do
    field :its_a_gift, :boolean, default: false
    field :total_price, :float

    # relações
    belongs_to :customer, Customer
    many_to_many :book, Book, join_through: "orders_books"

    timestamps()
  end

  @doc false
  def changeset(struct, params) do
    struct
    |> cast(params, [:total_price, :its_a_gift])
    |> validate_required(@fields)
    |> validate_required(:total_price, greater_than_or_equal_to: 0.00)
  end
end
