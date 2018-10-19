defmodule InvestoreWeb.Mixfile do
  use Mix.Project

  def project do
    [
      app: :investore_web,
      version: "0.0.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {InvestoreWeb, []},
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  defp deps do
    [
      {:investore_product_services, in_umbrella: true},
      {:ex_machina, "~> 2.2.0"},
      {:faker, "~> 0.11.0", only: :test},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 2.2.11"},
      {:absinthe, "~> 1.4.0"},
      {:absinthe_relay, "~> 1.4.0"},
      {:absinthe_ecto, "~> 0.1.3"},
      {:absinthe_plug, "~> 1.4.0"},
      {:jason, "~> 1.1"},
      {:ueberauth, "~> 0.4.0"},
      {:ueberauth_identity, "~> 0.2.0"},
      {:ueberauth_google, "~> 0.7.0"},
      {:phoenix, "~> 1.3.3"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"}
    ]
  end
end
