defmodule InvestoreAccounts.MixProject do
  use Mix.Project

  def project do
    [
      app: :investore_accounts,
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

  defp elixirc_paths(:test), do: ["lib", "test"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger],
      mod: {InvestoreAccounts.Application, []}
    ]
  end

  defp deps do
    [
      {:ex_machina, "~> 2.2.0"},
      {:faker, "~> 0.11.0", only: :test},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 2.2.11"},
      {:ecto_enum, "~> 1.0"},
      {:guardian, "~> 1.1.1"}
    ]
  end

  defp aliases() do
    [
      test: ["ecto.create --quiet", "ecto.migrate", "test --no-start"]
    ]
  end
end
