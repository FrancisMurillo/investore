defmodule InvestoreProducts do
  @moduledoc nil

  alias Ecto.UUID

  alias __MODULE__, as: Context
  alias Context.{Product, Repo}

  def add_product(params) do
    %Product{uuid: UUID.generate()}
    |> Product.add_changeset(params)
    |> Repo.insert()
  end
end
