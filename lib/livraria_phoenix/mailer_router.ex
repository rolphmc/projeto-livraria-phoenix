defmodule LivrariaPhoenix.MailerRouter do

  import Bamboo.Email
  use Plug.Router
  use Plug.Debugger
  require Logger

    #https://www.tuliocalil.com.br/post/criando-servico-de-envio-de-e-mail-com-elixir

  plug(Plug.Logger, log: :debug)
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Server online...")

    new_email()
    |> to("meu@livraria_phoenix.com")
    |> from("meu@livraria_phoenix.com")
    |> subject("Teste")
    |> text_body("Testando envio de email")
    |> LivrariaPhoenix.Mailer.deliver_now

  end

  match _ do
    send_resp(conn, 404, "Página Não Encontrada!")
  end

end
