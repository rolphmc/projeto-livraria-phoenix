defmodule LivrariaPhoenix.TestHelpers do
  alias LivrariaPhoenix.{Books, Customers}

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

  def category_fixture(params \\ %{}) do
    {:ok, category} =
      params
      |> Enum.into(%{category: "Testando"})
      |> Books.create_category()
    category
  end

end
