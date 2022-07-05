defmodule LivrariaPhoenix.Books.CategoriesBooks do
  use Ecto.Schema
  import Ecto.Changeset

  alias LivrariaPhoenix.Books.{Book, Subcategory}

  @fields [:book_id, :subcategory_id]

  schema "categories_books" do

    # relações
    belongs_to :book, Book
    belongs_to :subcategory, Subcategory

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
  end

end
