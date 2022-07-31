defmodule LivrariaPhoenix.Books.CategoriesBooks do
  use Ecto.Schema
  import Ecto.Changeset

  alias LivrariaPhoenix.Books.{Book, Subcategory}


  @already_exists "ALREADY_EXISTS"

  schema "categories_books" do

    # relações
    belongs_to :book, Book
    belongs_to :subcategory, Subcategory

    timestamps()
  end

  @doc """
  @require_fields
  #campos obrigatórios
  carrega o "Word list sigil' `~w` com o modificador "a" (átomos) que é responsável por facilitar a criação de uma lista de átomos
  """
  @require_fields ~w(book_id subcategory_id)a

  def changeset(struct, params) do
    struct
    |> cast(params, @require_fields)
    |> validate_required(@require_fields)
    |> unique_constraint([:book, :subcategory],
    name: :user_id_project_id_unique_index,
    message: @already_exists)
  end

end
