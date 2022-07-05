defmodule LivrariaPhoenix.Mailer do
  use Bamboo.Mailer, otp_app: :livraria_phoenix

  import Bamboo.Email


  def boas_vindas(customer) do
    deliver_later(
      new_email(
        from: "no-reply@livrariaphoenix.com",
        to: customer.email,
        subject: "Bem vindo #{customer.username}, legal tê-lo aqui",
        text_body: "#{customer.username}, Obrigado por se registrar e se tornar mais um cliente da Livraria Phoenix, aproveite!",
        html_body: "<strong>Obrigado por se registrar e se tornar mais um cliente da Livraria Phoenix, aproveite!</strong>"
      )
    )
  end
end
