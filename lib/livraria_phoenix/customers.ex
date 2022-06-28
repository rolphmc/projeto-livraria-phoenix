defmodule LivrariaPhoenix.Customers do

  @moduledoc """
    Contexto relacionado aos clientes do projeto
  """

  alias LivrariaPhoenix.Repo
  alias LivrariaPhoenix.Customers.Customer

  # ###########################
  #                   Customers
  # ###########################

  #cria um usuário- opção de interface para cadastro de serviços diversos
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

end
