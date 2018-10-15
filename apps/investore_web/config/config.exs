# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :investore_web, InvestoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YZJUtBTowKRGJSDLEu6aGoxUw56t9Psm2iw3NfmK7ukTNKCDwK9yt51h1+z5S8J1",
  render_errors: [view: InvestoreWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: InvestoreWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
