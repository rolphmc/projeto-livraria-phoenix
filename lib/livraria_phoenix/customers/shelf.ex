defmodule LivrariaPhoenix.Customers.Shelf do
  use Ecto.Schema
  import Ecto.Changeset

  alias LivrariaPhoenix.Customers.Customer
  alias LivrariaPhoenix.Books.Book

  # intenção de poder criar categorias customizadas de prateleiras para os customers

  @fields [:customer_id]

  schema "shelfs" do
    # relações
    belongs_to :customer, Customer
    many_to_many :book, Book, join_through: "books_shelfs"

    timestamps()
  end

  @doc false
  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
