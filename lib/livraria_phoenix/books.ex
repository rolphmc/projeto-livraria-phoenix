defmodule LivrariaPhoenix.Books do

  @moduledoc """
    regras de negócio relacionada ao contexto dos livros
  """

  alias LivrariaPhoenix.Books.{Category, Book}

  alias LivrariaPhoenix.Books.Category
  alias LivrariaPhoenix.Books.Book
  alias LivrariaPhoenix.Repo

  # ###########################
  #                  Categories
  # ###########################

      # pag 124 p.phoenix ensina a adcionar multiplos registros

  def create_category(category) do
    Repo.insert!(%Category{category: category})
  end

  def view_all_categories do
    Repo.all(Category)
  end

  def view_category(index) do
    Repo.get!(Category, index)
  end

  def update_categorie(category) do
    #verificar como selecionar a categoria correta
    Repo.insert!(%Category{category: category})
  end

  def delete_category do

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
