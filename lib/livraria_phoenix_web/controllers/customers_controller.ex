defmodule LivrariaPhoenixWeb.CustomersController do
  use LivrariaPhoenixWeb, :controller

  alias LivrariaPhoenix.Customers
  alias LivrariaPhoenix.Customers.Customer

  #chama tela novo cadastro
  def new(conn, _params) do
    changeset = Customers.change_registration(%Customer{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  #cria novo cadastro
  def create(conn, %{"customer" => customer_params}) do
    case Customers.register_customer(customer_params) do
      {:ok, customer} ->
        IO.puts("##########################################")

        conn
        |> put_flash(:info, "#{customer.username} created!")
        |> redirect(to: Routes.customers_path(conn, :show, customer))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  #apresenta cadastro do cliente selecionado
  def show(conn, %{"id" => id}) do
    customer = Customers.get_customer(id)
    render(conn, "show.html", customer: customer)
  end

end
