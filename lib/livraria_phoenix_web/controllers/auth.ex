defmodule LivrariaPhoenixWeb.Auth do
  import Plug.Conn

    #customers foi apenas uma convenção que adotei, porém esse código servirá para adms e autores

      def init(opts), do: opts

      def call(conn, _opts) do
        customer_id = get_session(conn, :customer_id)
        customer = customer_id && LivrariaPhoenix.Customers.get_customer(customer_id)
        assign(conn, :current_customer, customer)
      end

      # um plug é caracterizado por essas duas funções ^^

  #armazenando o id do cliente ou usuário na sessão
  def login(conn, customer) do
    conn
    |> assign(:current_customer, customer)
    |> put_session(:customer_id, customer.id)
    |> configure_session(renew: true)
  end

end
