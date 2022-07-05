defmodule LivrariaPhoenix.Books.Category do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query

  alias LivrariaPhoenix.Books.Subcategory

  @fields [:category]

  schema "categories" do
    field :category, :string

    # relações
    has_many :subcategory, Subcategory

    timestamps()
  end

  @doc false
  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:category)
    |> validate_length(:category, min: 2, max: 15)
  end

  # ----------------Consultas

  def alphabetical(query) do
    from c in query, order_by: c.category
  end
end
