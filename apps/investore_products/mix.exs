defmodule InvestoreProducts.MixProject do
  use Mix.Project

  def project do
    [
      app: :investore_products,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {InvestoreProducts.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ex_machina, "~> 2.2.0"},
      {:faker, "~> 0.11.0", only: :test},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 2.2.11"},
      {:swarm, "~> 3.3.0"}
    ]
  end

  defp aliases() do
    [
      "ecto.reset": ["ecto.create --quiet", "ecto.rollback --all", "ecto.migrate"],
      "ecto.reset.seed": ["ecto.reset", "ecto.seed"],
      "ecto.seed": ["run priv/repo/seeds.exs --no-start"],
      test: ["ecto.reset", "test --no-start"]
    ]
  end
end
