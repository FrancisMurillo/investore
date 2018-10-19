defmodule InvestoreWeb.ProductResolver do
  @moduledoc nil

  alias InvestoreProductServices

  alias InvestoreWeb.{ProductItem, Repo}

  def products(root, args, info) do
    case InvestoreProductServices.resolve_products(root, args, info) do
      {:ok, values} ->
        values
        |> Enum.map(&Map.from_struct/1)
        |> (&{:ok, &1}).()
      error -> error
    end
  end
end
