defmodule LivrariaPhoenixWeb.BooksController do
  use LivrariaPhoenixWeb, :controller

  alias LivrariaPhoenix.Books

  def index(conn, _params) do
    books = Books.books_list()
    render(conn, "index.html", books: books)
  end

  def show(conn, %{"id" => _id}) do
    id = 3
    book = Books.get_book(id)
    render(conn, "show.html", book: book)
  end
end
