# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :livraria_phoenix,
  ecto_repos: [LivrariaPhoenix.Repo]

# Configures the endpoint
config :livraria_phoenix, LivrariaPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: LivrariaPhoenixWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LivrariaPhoenix.PubSub,
  live_view: [signing_salt: "UNn6BCKR"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.

#config :livraria_phoenix, LivrariaPhoenix.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
# config :swoosh, :api_client, false

config :livraria_phoenix, LivrariaPhoenix.Mailer,
  adapter: Bamboo.LocalAdapter,
  open_email_in_browser_url: "http://localhost:4000/sent_emails" # optional

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

config :livraria_phoenix, LivrariaPhoenix.Mailer,
    adapter: Bamboo.SMTPAdapter,
    server: "smtp.mailtrap.io",
    port: 587,
    username: "549fde43742b58", # or {:system, "SMTP_USERNAME"}
    password: "8df9244aff9213", # or {:system, "SMTP_PASSWORD"}
    tls: :if_available, # can be `:always` or `:never`
    retries: 1
