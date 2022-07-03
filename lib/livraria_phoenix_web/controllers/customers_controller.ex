defmodule LivrariaPhoenixWeb.CustomersController do
  use LivrariaPhoenixWeb, :controller

  alias LivrariaPhoenixWeb.Auth
  alias LivrariaPhoenix.{Customers, Customers.Customer, Mailer}

  plug :authenticate when action in [:index, :show] #plug da função de auth

  #chama lista de clientes - Apenas para acesso interno
  def index(conn, _params) do
        customer = Customers.customer_list()
        render(conn, "index.html", customer: customer)
  end

  #chama tela novo cadastro
  def new(conn, _params) do
    changeset = Customers.change_registration(%Customer{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  #cria novo cadastro
  def create(conn, %{"customer" => customer_params}) do
    case Customers.register_customer(customer_params) do
      {:ok, customer} ->
        #email de boas vindas
        Mailer.boas_vindas(customer)

        conn
        |> Auth.login(customer)
        |> put_flash(:info, "#{customer.username} criado com sucesso, um e-mail de boas vindas foi enviado a seu email >.<")
        |> redirect(to: Routes.customers_path(conn, :show, customer))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  #apresenta tela de cadastro do cliente selecionado
  def show(conn, %{"id" => id}) do
    customer = Customers.get_customer(id)
    render(conn, "show.html", customer: customer)
  end

  #Verifica se cliente está logado
  defp authenticate(conn, _opts) do
    inspect(conn.assigns.current_customer)
    if conn.assigns.current_customer do
      conn
    else
      conn
      |> put_flash(:error, "Você deve se logar para acessar esta página")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end

end
