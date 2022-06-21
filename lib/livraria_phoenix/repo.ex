defmodule LivrariaPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :livraria_phoenix,
    adapter: Ecto.Adapters.Postgres
end
