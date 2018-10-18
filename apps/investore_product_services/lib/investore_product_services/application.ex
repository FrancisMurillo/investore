defmodule InvestoreProductServices.Application do
  @moduledoc false

  use Application
  alias Cluster

  alias InvestoreProductServices, as: Context
  alias Context.{NodePool}

  def start(_type, _args) do
    import Supervisor.Spec

    topologies = [
      nodes: [
        strategy: Cluster.Strategy.Epmd,
        config: [
          hosts: [:"product-1@whimsical", :"product-2@whimsical", :"product-3@whimsical"]
        ],
        connect: {__MODULE__, :register_node, []},
        disconnect: {__MODULE__, :unregister_node, []}
      ]
    ]

    children = [
      worker(NodePool, [[name: {:via, :global, {NodePool, Node.self()}}]], restart: :temporary),
      {Cluster.Supervisor, [topologies, [name: Context.ClusterSupervisor]]}
    ]

    opts = [strategy: :one_for_one, name: Context.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def register_node(node) do
    if Node.connect(node) == true do
      {NodePool, Node.self()}
      |> :global.whereis_name()
      |> NodePool.register_node(node)

      true
    else
      false
    end
  end

  def unregister_node(node) do
    Node.disconnect(node)

    {NodePool, Node.self()}
    |> :global.whereis_name()
    |> NodePool.unregister_node(node)

    true
  end

  def next_available_node(),
    do:
      {NodePool, Node.self()}
      |> :global.whereis_name()
      |> NodePool.next_available_node()
end
