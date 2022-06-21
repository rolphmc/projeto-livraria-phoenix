defmodule LivrariaPhoenixWeb.BooksView do
  use LivrariaPhoenixWeb, :view

  alias LivrariaPhoenix.Books

  def title(%Books.Book{title: title}) do
    title
    |> String.split("  ")
    |> Enum.at(0)
  end

end
