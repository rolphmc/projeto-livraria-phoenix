defmodule LivrariaPhoenix.Books do
  @moduledoc """
    regras de negócio relacionada aos books
  """

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
