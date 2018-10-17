defmodule InvestoreWeb.ProductResolver do
  @moduledoc nil

  def products(_root, _args, _info) do
    {:ok, [%{name: "kitten", description: "asds"}]}
  end
end
