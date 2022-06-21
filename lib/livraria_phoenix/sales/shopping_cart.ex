defmodule LivrariaPhoenix.ShoppingCart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shopping_carts" do
    field :quantity, :integer
    field :total_price, :float

    belongs_to :customers, Customer

    has_many :books, Book

    timestamps()
  end

  @doc false
  def changeset(shopping_cart, attrs) do
    shopping_cart
    |> cast(attrs, [:quantity, :total_price])
    |> validate_required([:quantity, :total_price])
  end
end
