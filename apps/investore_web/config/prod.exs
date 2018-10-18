use Mix.Config

config :investore_web, InvestoreWeb.Repo, adapter: Ecto.Adapters.Postgres

config :investore_web, InvestoreWeb.Endpoint,
  http: [:inet6, port: {:system, "PORT"}],
  url: [host: "example.com", port: 80],
  secret_key_base: "eF6pw2o+Xf5dCUgweS2jxrQBLtcEpfJ+raaxWuNG1rJLyIkjfkhdETX5Uk1SekSP",
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info
