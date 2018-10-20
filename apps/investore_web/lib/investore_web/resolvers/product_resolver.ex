defmodule InvestoreWeb.ProductResolver do
  @moduledoc nil

  alias InvestoreProductServices

  def search_products(root, args, info) do
    case InvestoreProductServices.resolve_search_products(root, args, info) do
      {:ok, values} ->
        values
        |> (&{:ok, &1}).()
      error -> error
    end
  end
end
