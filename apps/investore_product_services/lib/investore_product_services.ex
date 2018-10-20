defmodule InvestoreProductServices do
  @moduledoc nil

  alias InvestoreProducts, as: Core

  alias InvestoreProductServices, as: Context
  alias Context.{Application}

  def resolve_search_products(root, args, info) do
    Application.next_available_node()
    |> case do
      nil ->
        {:error, :no_available_node}

      node ->
        :rpc.call(node, Core, :resolve_search_products, [root, args, info])
    end
  end
end
