defmodule LivrariaPhoenixWeb.SubcategoriesController do
  use LivrariaPhoenixWeb, :controller

  alias LivrariaPhoenix.Books
  alias LivrariaPhoenix.Books.Subcategory

  plug :load_subcategories when action in [:index]
  plug :authenticate when action in [:index] #plug da função de auth

  def create(conn, %{"category" => category}) do
    #|> put_flash(:info, "categoria #{category["category_id"]} escolhida")
    id = Integer.parse(category["category_id"]) |> elem(0)
    redirect(conn, to: Routes.subcategories_path(conn, :index, id: id))
  end

  def index(conn, _params) do
    changeset = Books.change_subcategory(%Subcategory{})
    render(conn, "index.html", changeset: changeset)#..
  end

  def load_subcategories(conn, _) do
    assign conn, :subcategories, Books.list_subcategories(conn.params["id"])
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
