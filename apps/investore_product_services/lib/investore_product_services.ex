defmodule InvestoreProductServices do
  @moduledoc nil

  alias InvestoreProducts, as: Core

  alias InvestoreProductServices, as: Context
  alias Context.{Application}

  def get_all_products() do
    Application.next_available_node()
    |> case do
      nil ->
        {:error, :no_available_node}

      node ->
        :rpc.call(node, Core, :get_all_products, [])
    end
  end
end
