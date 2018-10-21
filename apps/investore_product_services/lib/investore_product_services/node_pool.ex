defmodule InvestoreProductServices.NodePool do
  @moduledoc nil

  use Agent
  alias Agent

  def start_link(opts),
    do: Agent.start_link(fn -> :queue.new() end, opts)

  def register_node(pid, node),
    do:
      Agent.update(pid, fn queue ->
        if :queue.member(node, queue) do
          queue
        else
          if Node.ping(node) == :pong do
            :queue.snoc(queue, node)
          else
            queue
          end
        end
      end)

  def unregister_node(pid, node),
    do:
      Agent.update(pid, fn queue ->
        if :queue.member(node, queue) do
          queue
          |> :queue.to_list()
          |> List.delete(node)
          |> :queue.from_list()
        else
          queue
        end
      end)

  def next_available_node(pid),
    do: Agent.get_and_update(pid, &next_connected_node/1)

  defp next_connected_node(queue) do
    if :queue.is_empty(queue) do
      {nil, queue}
    else
      {result, updated_queue} = :queue.out(queue)

      node =
        case result do
          :empty -> nil
          {:value, value} -> value
        end

      if Node.ping(node) == :pong do
        {node, :queue.snoc(updated_queue, node)}
      else
        next_connected_node(updated_queue)
      end
    end
  end

  def refresh_nodes(pid),
    do:
      :connected
      |> Node.list()
      |> Enum.each(fn node ->
        register_node(pid, node)
      end)
end
