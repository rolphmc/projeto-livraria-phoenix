defmodule LivrariaPhoenix.Books do

  @moduledoc """
    regras de negócio relacionada ao contexto dos livros
  """

  alias LivrariaPhoenix.Books.{Author, Book, Category, Subcategory, CategoriesBooks}

  alias LivrariaPhoenix.Repo

  # ###########################
  #                      Author
  # ###########################

  def register_author(name) do
    Repo.insert!(%Author{author_name: name})
  end

  # #########################
  #                Categories
  # #########################

      # pag 124 p.phoenix ensina a adcionar multiplos registros

  # ---------------Categories

  def change_category(%Category{} = category, params \\ %{}) do
    Category.changeset(category, params)
  end

  def create_category(category) do
    Repo.insert!(%Category{category: category}, on_conflict: :nothing)
  end

  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  def get_category(id) do
    Repo.get!(Category, id)
  end

  def list_categories do
    Category
    |> Category.alphabetical()
    |> Repo.all()
  end

  # ------------Subcategories
  def change_subcategory(%Subcategory{} = subcategory, params \\ %{}) do
    Subcategory.changeset(subcategory, params)
  end

  def create_subcategory(subcategory, category_id) do
    Repo.insert!(%Subcategory{subcategory: subcategory, category_id: category_id}, on_conflict: :nothing)
  end

  def get_subcategorie(id) do
    Repo.get!(Subcategory, id)
  end

  def get_subcategorie_by(params) do
    Enum.find(list_all_subcategories(), fn map ->
      Enum.all?(%{subcategory: to_string(params)}, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end

  def list_subcategories(id) do
    Subcategory
    |> Subcategory.alphabetical(id)
    |> Repo.all()
  end

  def list_all_subcategories() do
    Subcategory
    |> Subcategory.list_all_subcategories()
    |> Repo.all()
  end

  # ###########################
  #                       Books
  # ###########################

  def books_list do
    Book
    |> Book.list_all_books()
    |> Repo.all()
  end

  def change_book(%Book{} = book, params \\ %{}) do
    Book.changeset(book, params)
  end

  @doc """
  Retorna um %Ecto.changeset carregado com a subategoria, categoria e autor para compor o furmulário de cadastro de um novo livro. O parâmetro representa um id de uma subcategoria valida.
  ## Examples
      iex> create_book_chageset_load(id)
      [%Ecto.changeset{data: %Book{}}]
  """
  def create_book_chageset_load(id) do
    subcategory = get_subcategorie(id)
    category = get_category(subcategory.category_id)

    Book.changeset(%Book{}, %{subcategory: subcategory.subcategory, category: category.category, author: ""})
  end

  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  def get_book(id) do
    Repo.get!(Book, id)
  end

  def get_book_by(params) do
    Enum.find(books_list(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end

  def register_books(params) do
    %Book{}
    |> Ecto.build_assoc(:authors)
    |> Book.changeset(params)
    |> Repo.insert()
  end

  def register_categories_books(book, subcategory) do

    subcategory = Repo.get_by(Subcategory, subcategory: subcategory)

    #insert subcategory and book in categories_books
    Repo.insert(%CategoriesBooks{book_id: book.id, subcategory_id: subcategory.id})
  end
end
