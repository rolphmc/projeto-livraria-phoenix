defmodule LivrariaPhoenix.TestHelpers do
  alias LivrariaPhoenix.{Customers}

  def customer_fixture(params \\ %{}) do
    {:ok, customer} =
      params
      |> Enum.into(%{
        email: "customer@customer.com",
        name: "customer name",
        username: "customer#{System.unique_integer([:positive])}",
        password: params[:password] || "supersecret"
      })
      |> Customers.register_customer()
    customer
  end

end
