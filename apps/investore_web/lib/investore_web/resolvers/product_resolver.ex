defmodule InvestoreWeb.ProductResolver do
  @moduledoc nil

  alias InvestoreWeb.{ProductItem, Repo}

  def products(_root, _args, _info) do
    ProductItem
    |> Repo.all()
    |> (&{:ok, &1}).()
  end
end
