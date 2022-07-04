defmodule LivrariaPhoenixWeb.BooksController do
  use LivrariaPhoenixWeb, :controller

  alias LivrariaPhoenix.Books

  def index(conn, _params) do
    books = Books.books_list()
    render(conn, "index.html", books: books)
  end

  def create(conn, %{"subcategory" => subcategory_params}) do
    id = Integer.parse(subcategory_params["subcategory_id"]) |> elem(0)
    changeset = Books.chageset_load(id) #carrega categoria e subcategoria no changeset
    render(conn, "new.html", changeset: changeset)
  end

  def create_register(conn, %{"book" => book_params}) do
    case Books.register_books(book_params) do #futuramente criar tratativa de erros para categorias
      {:ok, book} ->

        Books.register_category_book(book)
        books = Books.books_list()

        conn
        |> put_flash(:info, "Livro: #{book.title} | criado com sucesso >.<")
        |> render("index.html", books: books)
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Books.get_book(id)
    render(conn, "show.html", book: book)
  end

end
