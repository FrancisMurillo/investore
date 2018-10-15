use Mix.Config

config :investore_web, InvestoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YZJUtBTowKRGJSDLEu6aGoxUw56t9Psm2iw3NfmK7ukTNKCDwK9yt51h1+z5S8J1",
  render_errors: [view: InvestoreWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: InvestoreWeb.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env()}.exs"
