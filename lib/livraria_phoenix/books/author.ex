defmodule LivrariaPhoenix.Books.Author do
  use Ecto.Schema
  import Ecto.Changeset

  alias LivrariaPhoenix.Books.Book

  @fields [:author_name]

  schema "authors" do
    field :author_name, :string

    has_many :books, Book

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint(@fields)
    |> validate_length(:author_name, min: 2, max: 60)
  end
end
