defmodule LivrariaPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more infor  tion on OTP Applications
  @moduledoc false

  use Application

  alias LivrariaPhoenix.MailerRouter

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LivrariaPhoenix.Repo,
      # Start the Telemetry supervisor
      LivrariaPhoenixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LivrariaPhoenix.PubSub},
      # Start the Endpoint (http/https)
      LivrariaPhoenixWeb.Endpoint,
      # Start a worker by calling: LivrariaPhoenix.Worker.start_link(arg)
      # {LivrariaPhoenix.Worker, arg}
      #inicie serviço de e-mail
      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: MailerRouter, options: [port: 8085])

    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LivrariaPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LivrariaPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
