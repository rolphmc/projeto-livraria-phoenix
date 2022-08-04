defmodule LivrariaPhoenix.Books.Subcategory do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias LivrariaPhoenix.Books.Category

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

  # ----------------Consultas

  def alphabetical(query, id) do
    from c in query, order_by: c.subcategory, where: c.category_id == ^id
  end

  def list_all_subcategories(query) do
    from c in query, order_by: c.subcategory
  end

end
