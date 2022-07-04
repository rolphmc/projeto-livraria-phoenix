defmodule LivrariaPhoenixWeb.BooksController do
  use LivrariaPhoenixWeb, :controller

  alias LivrariaPhoenix.Books

  def index(conn, _params) do
    books = Books.books_list()
    render(conn, "index.html", books: books)
  end

  def create(conn, %{"subcategory" => subcategory}) do
    id = Integer.parse(subcategory["subcategory_id"]) |> elem(0)
    changeset = Books.chageset_load(id)
    inspect(changeset)
    render(conn, "new.html", changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    book = Books.get_book(id)
    render(conn, "show.html", book: book)
  end

end
