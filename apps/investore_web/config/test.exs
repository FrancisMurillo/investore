use Mix.Config

config :investore_web, InvestoreWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
