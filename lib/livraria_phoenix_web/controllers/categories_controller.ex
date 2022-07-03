defmodule LivrariaPhoenixWeb.CategoriesController do
  use LivrariaPhoenixWeb, :controller

  alias LivrariaPhoenix.Books
  alias LivrariaPhoenix.Books.Category

  plug :load_categories when action in [:index, :show]

  def create(conn, %{"category" => category}) do
    redirect(conn, to: Routes.subcategories_path(conn, :index, category: category))
  end

  def index(conn, _params) do
    changeset = Books.change_category(%Category{})
    render(conn, "index.html", changeset: changeset)#..
  end

  def load_categories(conn, _) do
    assign conn, :categories, Books.list_categories()
  end


end
