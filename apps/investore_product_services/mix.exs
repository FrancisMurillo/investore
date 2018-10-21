defmodule InvestoreProductServices.MixProject do
  use Mix.Project

  def project do
    [
      app: :investore_product_services,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {InvestoreProductServices.Application, []}
    ]
  end

  defp deps do
    [
      {:investore_products, in_umbrella: true, runtime: false},
      {:local_cluster, "~> 1.0", only: [:test]},
      {:libcluster, "~> 3.0.3"},
      {:swarm, "~> 3.3.1"}
    ]
  end
end
