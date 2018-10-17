defmodule InvestoreProducts.Factory do
  @moduledoc nil

  use ExMachina.Ecto, repo: InvestoreProducts.Repo

  alias Ecto.UUID
  alias Faker

  alias InvestoreProducts.Product

  def product_factory,
    do: %Product{
      uuid: UUID.generate(),
      name: sequence(:name, &"name-#{&1}"),
      description: sequence(:description, &"description-#{&1}"),
      image_url: "http://lorempixel.com/400/200"
    }
end
