defmodule LivrariaPhoenix.Books.CategoriesBooks do
  use Ecto.Schema

  alias LivrariaPhoenix.Books.{Book, Subcategory}

  @primary_key false #necessário para entender que não há necessidade de exigir um campo id
  schema "categories_books" do
    belongs_to :book, Book
    belongs_to :subcategory, Subcategory

    timestamps()
  end
end
