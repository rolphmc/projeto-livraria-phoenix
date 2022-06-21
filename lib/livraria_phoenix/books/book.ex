defmodule LivrariaPhoenix.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :category, :string
    field :description, :string
    field :image, :string
    field :price, :float
    field :subcategory, :string
    field :title, :string

    #belongs_to :author, Author

    #has_many :customers, Customer
    #has_many :shopping_carts, ShoppingCart

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:category, :subcategory, :title, :description, :author, :price, :image])
    |> validate_required([:category, :subcategory, :title, :description, :author, :price, :image])
  end
end
