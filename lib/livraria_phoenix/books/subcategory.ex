defmodule LivrariaPhoenix.Books.Subcategory do
  use Ecto.Schema
  import Ecto.Changeset

  alias LivrariaPhoenix.Books.Category
  alias LivrariaPhoenix.Books.Book

  @fields [:subcategory, :category_id]

  schema "subcategories" do
    field :subcategory, :string

    # relações
    belongs_to :category, Category
    many_to_many :book, Book, join_through: "categories_books"

    timestamps()
  end

  @doc false
  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:subcategory)
    |> validate_length(:subcategory, min: 2, max: 15)
  end
end
