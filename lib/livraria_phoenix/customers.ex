defmodule LivrariaPhoenix.Customers do

  @moduledoc """
    Contexto relacionado aos clientes do projeto
  """

  alias LivrariaPhoenix.Repo
  alias LivrariaPhoenix.Customers.Customer

  # ###########################
  #                   Customers
  # ###########################

  #cria um usuário - opção de interface para cadastro de serviços diversos
  def create_user(params \\ %{}) do
    %Customer{}
    |> Customer.changeset(params)
    |> Repo.insert()
  end

  #solicitação de changeset
  def change_registration(%Customer{} = customer, params) do
    Customer.register_changeset(customer, params)
  end

  #cria o novo registro
  def register_customer(params \\ %{}) do
    %Customer{}
    |> Customer.register_changeset(params)
    |> Repo.insert()
  end

  #seleciona um cliente específico
  def get_customer(id) do
    Repo.get!(Customer, id)
  end

  #localiza cliente por um dado parametro
  def get_customer_by(params) do
    Repo.get_by(Customer, params)
  end

  #lista todos os clientes
  def customer_list do
    Repo.all(Customer)
  end

  def authenticate_by_username_and_pass(username, given_pass) do
    customer = get_customer_by(username: username)
    IO.inspect(customer)
    cond do
      customer && Pbkdf2.verify_pass(given_pass, customer.encrypted_password) ->
        {:ok, customer} #cliente e senha existe e coeincidem
      customer ->
        {:error, :unauthorized} #cliente existe, mas senha está incorreta
      true ->
        Pbkdf2.no_user_verify() # cliente não existe. Proteção contra timming Attaks - entender mais.
        {:error, :not_found}
    end
  end

end
