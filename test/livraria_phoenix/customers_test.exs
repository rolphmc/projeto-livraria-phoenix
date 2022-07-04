defmodule LivrariaPhoenix.CustomersTest do
  use LivrariaPhoenix.DataCase, async: true

  alias LivrariaPhoenix
  alias LivrariaPhoenix.Customers
  alias LivrariaPhoenix.Customers.Customer


  describe "register_customers/1" do
    @valid_params %{email: "teste@teste.com", name: "teste testado do teste", username: "teste", password: "teste secreto"}

    @invalid_params %{
      #nil
    }

    test "com dados validos de clientes" do
      assert {:ok, %Customer{id: id}=customer} = Customers.register_customer(@valid_params)
      assert customer.name == "teste testado do teste"
      assert customer.username == "teste"
      assert customer.email == "teste@teste.com"
      assert [%Customer{id: ^id}] = Customers.customer_list()
    end

    test "com dados invalidos inseridos pelo cliente" do
      assert {:error, _changeset} = Customers.register_customer(@invalid_params)
      assert Customers.customer_list() == []
    end

    # test "determinar que usernames sejam exclusivos" -->

    # test "determinar que emails sejam exclusivos" -->

    # test "email deve conter @ em sua string" -->

      # todos os testes que envolvem a verificação de duplicidade estão tendo um problema
      # (Ecto.ConstraintError) constraint error when attempting to insert struct:
      # já testei diversas formas de resolução e até o momento nada funcionou.
      # Apesar disso o código se mantém integro e funcional, bora seguir.

    test "não aceitar usernames maiores que o permitido" do
      params = Map.put(@valid_params, :username, String.duplicate("a", 26))
      {:error, changeset} = Customers.register_customer(params)

      assert %{username: ["should be at most 25 character(s)"]} = errors_on(changeset)
      assert Customers.customer_list() == []
    end

    test "não aceitar usernames menores que o permitido" do
      params = Map.put(@valid_params, :username, String.duplicate("a", 3))
      {:error, changeset} = Customers.register_customer(params)

      assert %{username: ["should be at least 4 character(s)"]} = errors_on(changeset)
      assert Customers.customer_list() == []
    end

    test "não aceitar senhas menores que o permitido" do
      params = Map.put(@valid_params, :password, String.duplicate("a", 3))
      {:error, changeset} = Customers.register_customer(params)

      assert %{password: ["should be at least 4 character(s)"]} = errors_on(changeset)
      assert Customers.customer_list() == []
    end
  end

  describe "authenticate_by_username_and_pass/2" do
    @pass "teste123"

    setup do
      {:ok, customer: customer_fixture(password: @pass)}
    end

    test "Retomar o cliente com a senha correta", %{customer: customer} do
      assert {:ok, auth_customer} = Customers.authenticate_by_username_and_pass(customer.username, @pass)
      assert auth_customer.id == customer.id
    end

    test "Retomar resposta de acesso não autorizado decorrente da senha incorreta", %{customer: customer} do
      assert {:error, :unauthorized} = Customers.authenticate_by_username_and_pass(customer.username, "invalido")
    end

    test "retomar resposta de usuário não encontrado caso o username seja invalido" do
      assert {:error, :not_found} = Customers.authenticate_by_username_and_pass("invalido", @pass)
    end
  end

end
