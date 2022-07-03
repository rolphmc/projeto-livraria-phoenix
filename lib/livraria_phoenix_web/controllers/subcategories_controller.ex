defmodule LivrariaPhoenixWeb.SubcategoriesController do
  use LivrariaPhoenixWeb, :controller

  alias LivrariaPhoenix.Books
  alias LivrariaPhoenix.Books.Subcategory

  plug :load_subcategories when action in [:index]

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
    IO.puts(String.duplicate("-> #{conn.params["id"]}", 60))
    assign conn, :subcategories, Books.list_subcategories(conn.params["id"])
  end

end
