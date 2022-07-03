defmodule LivrariaPhoenix.Books do

  @moduledoc """
    regras de negócio relacionada ao contexto dos livros
  """

  alias LivrariaPhoenix.Books.{Book, Category, Subcategory}

  alias LivrariaPhoenix.Repo

  # #########################
#                  Categories
  # #########################

      # pag 124 p.phoenix ensina a adcionar multiplos registros

  # ---------------Categories

  def change_category(%Category{} = category, params \\ %{}) do
    Category.changeset(category, params)
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

  def list_subcategories(id) do
    IO.puts(String.duplicate("#", 60))
    IO.puts("O id selecionado para lista foi: #{id}")
    Subcategory
    |> Subcategory.alphabetical(id)
    |> Repo.all()
  end

  # ###########################
  #                       Books
  # ###########################

  def books_list do
    Repo.all(Book)
  end

  def get_book(id) do
    Repo.get!(Book, id)
  end

  def get_book_by(params) do
    Enum.find(books_list(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end
