defmodule LivrariaPhoenix.Sales.OrdersBooks do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:quantity, :total_price]

  schema "orders_books" do
    field :quantity, :integer
    field :total_price, :float

    timestamps()
  end

  @doc false
  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:quantity, greater_than_or_equal_to: 0)
    |> validate_length(:total_price, greater_than_or_equal_to: 0)
  end
end
