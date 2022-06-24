defmodule LivrariaPhoenixWeb.BooksView do
  use LivrariaPhoenixWeb, :view

  alias LivrariaPhoenix.Books

  # não sei o motivo dessa função visto que book.title resolve o problema
  def title(%Books.Book{title: title}) do
    title
    |> String.split("  ")
    |> Enum.at(0)
  end
end
