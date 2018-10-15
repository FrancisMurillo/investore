defmodule InvestoreProducts.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {InvestoreProducts.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: InvestoreProducts.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
