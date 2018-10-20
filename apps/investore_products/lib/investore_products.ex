defmodule InvestoreProducts do
  @moduledoc nil

  import Ecto.Query
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

  def resolve_search_products(_root, %{search_query: query}, _info) do
    Product
    |> search_query(query)
    |> Repo.all()
    |> (&{:ok, &1}).()
  end

  defp search_query(query, search_term) do
    if search_term != "" do
      from(p in query,
        where: fragment("? % ?", p.name, ^search_term) or fragment("? % ?", p.description, ^search_term),
        order_by: [desc: fragment("similarity(?, ?)", p.name, ^search_term), desc: fragment("similarity(?, ?)", p.description, ^search_term)]
      )
    else
      query
    end
  end
end
