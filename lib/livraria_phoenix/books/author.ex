defmodule LivrariaPhoenix.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :author_name, :string

    has_many :books, Book

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:author_name])
    |> validate_required([:author_name])
  end
end
