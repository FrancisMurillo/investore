use Mix.Config

config :investore_web, InvestoreWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "investore_dev",
  username: "investore_user",
  password: "investore1234",
  hostname: "localhost",
  port: "5432",
  pool_size: 2

config :investore_web, InvestoreWeb.Endpoint,
  http: [port: 41000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    npm: ["run", "watch", cd: Path.expand("../assets", __DIR__)]
  ]

config :investore_web, InvestoreWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth, ### In Secret
  client_id: "",
  client_secret: ""

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

import_config "dev.secret.exs"
