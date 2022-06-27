defmodule LivrariaPhoenix.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  alias LivrariaPhoenix.Books.Book
  alias LivrariaPhoenix.Sales.Order
  alias LivrariaPhoenix.Customers.Shelf

  @fields [:email, :name, :username, :encrypted_password]

  schema "customers" do
    field :email, :string
    field :encrypted_password, :string
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true

    # relações
    has_one :shelf, Shelf
    has_many :orders, Order
    many_to_many :book, Book, join_through: "shopping_carts"

    timestamps()
  end

  @doc false
  def changeset(customer, params) do
    customer
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
