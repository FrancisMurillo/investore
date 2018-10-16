use Mix.Config

config :investore_products, InvestoreAccounts.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "investore_test",
  username: "investore_user",
  password: "investore1234",
  hostname: "localhost",
  port: "5432",
  pool: Ecto.Adapters.SQL.Sandbox
