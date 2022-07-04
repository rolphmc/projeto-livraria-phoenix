defmodule LivrariaPhoenix.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  alias LivrariaPhoenix.Sales.Order
  alias LivrariaPhoenix.Books.{Author, Subcategory}
  alias LivrariaPhoenix.Customers.{Shelf, Customer}

  @fields [:description, :price, :title, :subcategory_fake, :category_fake]

  schema "books" do
    field :description, :string
    field :image, :string
    field :price, :float
    field :title, :string
    field :subcategory_fake, :string, virtual: true
    field :category_fake, :string, virtual: true

    # relações
    belongs_to :author, Author
    many_to_many :subcategory, Subcategory,  join_through: "categories_books"
    many_to_many :order, Order, join_through: "orders_books"
    many_to_many :shelf, Shelf, join_through: "books_shelfs"
    many_to_many :customer, Customer, join_through: "shopping_carts"

    timestamps()
  end

  @doc false
  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_required(:price, greater_than_or_equal_to: 0.00)
    |> validate_length(:description, min: 10, max: 256)
    |> validate_length(:title, min: 10, max: 60)
    |> assoc_constraint(:author) #--> funcional (usar nome da associação belongs_to)


    # assoc_constraint --> usar recurso onde for necessário em outras tables
  end
end
