defmodule LivrariaPhoenix.Customers do
  @moduledoc """
    Contexto relacionado aos clientes do projeto
  """
  alias LivrariaPhoenix.Customers.Customer

  def customers_list do
    [
      %Customer{ email: "rmc.rodolfo@gmail.com",encrypted_password: "", name: "Rodolfo Mota de Carvalho", password: "123456789", username: "RolphMc1"},
      %Customer{ email: "rmc.rodolfo2@gmail.com",encrypted_password: "", name: "Rodolfo Motta de Carvalho", password: "123456789", username: "RolphMc2"},
      %Customer{ email: "rmc.rodolfo3@gmail.com",encrypted_password: "", name: "Rodolfo Motta de Carvallo", password: "123456789", username: "RolphMc3"},
    ]
  end

end
