use Mix.Config

config :investore_web, InvestoreAccounts.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "investore_test",
  username: "investore_user",
  password: "investore1234",
  hostname: "localhost",
  port: "5432",
  pool: Ecto.Adapters.SQL.Sandbox

config :investore_web, InvestoreWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
