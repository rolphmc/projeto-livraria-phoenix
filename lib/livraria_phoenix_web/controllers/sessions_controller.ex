defmodule LivrariaPhoenixWeb.SessionsController do
  use LivrariaPhoenixWeb, :controller

  #chama tela de login
  def new(conn, _) do
    render(conn, "new.html")
  end

  #cria sessão autenticada
  def create(conn, %{"sessions" => %{"username" => username, "password" => pass}}) do
    case LivrariaPhoenix.Customers.authenticate_by_username_and_pass(username, pass) do
      {:ok, customer} ->
        conn
        |> LivrariaPhoenixWeb.Auth.login(customer)
        |> put_flash(:info, "Bem vindo, obrigado por retornar!")
        |> redirect(to: Routes.books_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Combinação de senha e password é invalida, tente novamente!")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> LivrariaPhoenixWeb.Auth.logout()
    |> redirect(to: Routes.books_path(conn, :index))
  end

end
