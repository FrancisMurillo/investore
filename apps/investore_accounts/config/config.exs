use Mix.Config

config :investore_accounts, ecto_repos: [InvestoreAccounts.Repo]

config :investore_accounts, InvestoreAccounts.Guardian,
  issuer: "investore",
  secret_key: "nSfikL7JiRGdAKoFfnS8hrhP1+9s/6cI+X+QfrrymyjY8Om9izdn/na03CjU6zVo"

import_config "#{Mix.env()}.exs"
