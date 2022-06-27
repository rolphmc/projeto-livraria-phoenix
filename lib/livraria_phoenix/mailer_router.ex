defmodule LivrariaPhoenix.MailerRouter do
    use Plug.Router
    use Plug.Debugger
    require Logger

    #https://www.tuliocalil.com.br/post/criando-servico-de-envio-de-e-mail-com-elixir

  plug(Plug.Logger, log: :debug)
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Server online...")
  end

  match _ do
    send_resp(conn, 404, "Página Não Encontrada!")
  end

end
