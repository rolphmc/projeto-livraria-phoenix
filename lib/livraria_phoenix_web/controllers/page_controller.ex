defmodule LivrariaPhoenixWeb.PageController do
  use LivrariaPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
