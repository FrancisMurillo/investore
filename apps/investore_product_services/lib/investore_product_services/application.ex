defmodule InvestoreProductServices.Application do
  @moduledoc false

  use Application
  alias Cluster

  alias InvestoreProductServices, as: Context
  alias Context.{NodePool}

  def start(_type, _args) do
    import Supervisor.Spec

    {:ok, hostname} = :inet.gethostname()

    topologies = [
      nodes: [
        strategy: Cluster.Strategy.Epmd,
        config: [
          hosts:
            1
            |> Range.new(3)
            |> Enum.map(fn index ->
              "product-#{index}@#{hostname}"
              |> String.to_atom()
            end)
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

  def refresh_nodes(),
    do:
      {NodePool, Node.self()}
      |> :global.whereis_name()
      |> NodePool.refresh_nodes()
end
