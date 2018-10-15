use Mix.Config

config :investore_products, ecto_repos: [InvestoreProducts.Repo]

import_config "#{Mix.env()}.exs"
