defmodule LivrariaPhoenixWeb.CustomersController do
  use LivrariaPhoenixWeb, :controller

  alias LivrariaPhoenix.Customers
  alias LivrariaPhoenix.Customers.Customer

  def new(conn, _params) do
    changeset = Customers.change_customer(%Customer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"customer" => customer_params}) do
    case Customers.create_customer(customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "#{customer_params.name} created!")
        |> redirect(to: Routes.customers_path(conn, :show, customer))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
