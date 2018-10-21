use Mix.Config

config :investore_products, ecto_repos: [InvestoreProducts.Repo]

config :investore_products, InvestoreProducts.Repo, migration_source: "product_migrations"

import_config "#{Mix.env()}.exs"
