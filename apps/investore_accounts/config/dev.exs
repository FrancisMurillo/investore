use Mix.Config

config :investore_accounts, InvestoreAccounts.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "investore_dev",
  username: "investore_user",
  password: "investore1234",
  hostname: "localhost",
  port: "5432",
  pool_size: 2
