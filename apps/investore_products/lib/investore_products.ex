defmodule InvestoreProducts do
  @moduledoc nil

  alias Ecto.UUID

  alias __MODULE__, as: Context
  alias Context.{Product, Repo}

  def add_product(params) do
    uuid = Ecto.UUID.generate()

    %Product{uuid: uuid}
    |> Product.add_changeset(params)
    |> Repo.insert()
  end

  def get_all_products() do
    Repo.all(Product)
  end
end
