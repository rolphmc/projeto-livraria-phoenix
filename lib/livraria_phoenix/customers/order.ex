defmodule LivrariaPhoenix.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :total_price, :float

    #belongs_to :customers, Customer

    #has_one :shopping_carts, ShoppingCart

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:total_price])
    |> validate_required([:total_price])
  end
end
