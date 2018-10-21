defmodule InvestoreProductServices do
  @moduledoc nil

  alias InvestoreProductServices, as: Context
  alias Context.{Application}

  def resolve_search_products(root, args, info) do
    Application.next_available_node()
    |> case do
      nil ->
        {:error, :no_available_node}

      node ->
        :rpc.call(node, InvestoreProducts, :resolve_search_products, [root, args, info])
    end
  end
end
