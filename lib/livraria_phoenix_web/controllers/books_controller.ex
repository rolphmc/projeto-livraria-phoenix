defmodule LivrariaPhoenixWeb.BooksController do
  use LivrariaPhoenixWeb, :controller

  alias LivrariaPhoenix.Books
  plug :authenticate when action in [:new,] #plug da função de auth


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
        Books.register_categories_books(book, book_params["subcategory"])
        conn
        |> put_flash(:info, "Livro: #{book.title} | criado com sucesso >.<")
        |> render("index.html", books: Books.books_list())
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Books.get_book(id)
    render(conn, "show.html", book: book)
  end


    #Verifica se cliente está logado
      defp authenticate(conn, _opts) do
        inspect(conn.assigns.current_customer)
        if conn.assigns.current_customer do
          conn
        else
          conn
          |> put_flash(:error, "Você deve se logar para acessar esta página")
          |> redirect(to: Routes.books_path(conn, :index))
          |> halt()
        end
      end

end
