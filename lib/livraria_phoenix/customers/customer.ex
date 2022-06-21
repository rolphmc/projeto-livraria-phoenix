defmodule LivrariaPhoenix.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :email, :string
    field :encrypted_password, :string
    field :name, :string
    field :password, :string
    field :username, :string

    #has_many :books, Book
    #has_many :orders, Order
    #has_many :shopping_carts, ShoppingCart

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:username, :name, :email, :encrypted_password, :password])
    |> validate_required([:username, :name, :email, :encrypted_password, :password])
  end
end
