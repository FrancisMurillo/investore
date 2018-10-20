defmodule InvestoreWeb.Schema do
  @moduledoc nil

  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  alias InvestoreWeb.{ProductResolver}

  object :product do
    field :uuid, non_null(:id)
    field :name, non_null(:string)
    field :description, :string
    field :image_url, non_null(:string)
  end

  query do
    field :search_products, non_null(list_of(non_null(:product))) do
      arg :search_query, non_null(:string)
      resolve &ProductResolver.search_products/3
    end
  end
end
