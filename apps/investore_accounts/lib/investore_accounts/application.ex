defmodule InvestoreAccounts.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {InvestoreAccounts.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: InvestoreAccounts.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
