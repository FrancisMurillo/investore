defmodule InvestoreWeb do
  @moduledoc nil

  use Application

  def start(_type, _args) do
    children = [
      {InvestoreWeb.Endpoint, []},
      {InvestoreWeb.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: InvestoreWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    InvestoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
