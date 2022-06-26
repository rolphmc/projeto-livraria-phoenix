defmodule LivrariaPhoenix.Customers do
  import Ecto.Changeset

  @moduledoc """
    Contexto relacionado aos clientes do projeto
  """
  alias LivrariaPhoenix.Customers.Customer

  # ###########################
  #                   Customers
  # ###########################

  def create_customer (any) do

  end

  def register_changeset(params \\ %{}) do
    %Customer{}
    |> cast(params, [:username, :name, :email, :password])
    |> validate_required([:username, :name, :email, :password])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> validate_format(:email, ~r/@/)
    |> validate_format(:username, ~r/^[a-zA-Z0-9]*$/)
    |> validate_length(:password, min: 4)
  end

  def customers_list do
    [
      %Customer{
        email: "rmc.rodolfo@gmail.com",
        encrypted_password: "",
        name: "Rodolfo Mota de Carvalho",
        password: "123456789",
        username: "RolphMc1"
      },
      %Customer{
        email: "rmc.rodolfo2@gmail.com",
        encrypted_password: "",
        name: "Rodolfo Motta de Carvalho",
        password: "123456789",
        username: "RolphMc2"
      },
      %Customer{
        email: "rmc.rodolfo3@gmail.com",
        encrypted_password: "",
        name: "Rodolfo Motta de Carvallo",
        password: "123456789",
        username: "RolphMc3"
      }
    ]
  end
end
