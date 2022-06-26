defmodule LivrariaPhoenix.Books do
  @moduledoc """
    regras de negócio relacionada ao contexto dos livros
  """

  alias LivrariaPhoenix.Books.Category
  alias LivrariaPhoenix.Repo

  # ###########################
  # gerenciamento de categorias
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


  def books_list do
    # temporary function sample
    [
      """
      %Book{id: 1, category: "programação", subcategory: "logica", title: "Aprenda a programar com pyton", description: "Descomplicando o desenvolvimento de software", image: "/", price: "39,90"},
      %Book{id: 2, category: "programação", subcategory: "games", title: "TDD para games", description: "Desenvolvimento guiado a testes para jogos digitais", image: "/", price: "69,90"},
      %Book{id: 3, category: "mobile", subcategory: "android", title: "Ionic 6", description: "Desenvolvimento multiplataforma para dispositivos móveis", image: "/", price: "79,90"},
      """
    ]
  end

  def get_book(id) do
    Enum.find(books_list(), fn map -> map.id == id end)
  end

  def get_book_by(params) do
    Enum.find(books_list(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end
