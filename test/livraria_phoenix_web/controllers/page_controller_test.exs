defmodule LivrariaPhoenixWeb.PageControllerTest do
  use LivrariaPhoenixWeb.ConnCase

  # ###########################
  #        testes de integração
  # ###########################

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Bem vindo a Livraria Phoenix!"
  end
end
