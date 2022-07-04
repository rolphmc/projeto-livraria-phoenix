defmodule LivrariaPhoenixWeb.PageControllerTest do
  use LivrariaPhoenixWeb.ConnCase

  # #########################
  #      testes de integração
  # #########################

  #----------página principal
  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Bem vindo a Livraria Phoenix!"
  end

  #-------------páginas Books
  test "GET /categories" do
    #conn = get(conn, "/categories")
    #assert html_response(conn, 200) =~ "Escolha a Categoria"
  end

  #--------páginas customers
  #broqueio de autenticação
  test "GET /customers", %{conn: conn} do
    conn = get(conn, "/customers")
    assert html_response(conn, 302) =~ "You are being "
  end

end
