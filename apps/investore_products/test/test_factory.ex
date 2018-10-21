defmodule InvestoreProducts.TestFactory do
  @moduledoc nil

  use ExMachina.Ecto, repo: InvestoreProducts.Repo

  alias Faker

  alias InvestoreProducts.Product

  def product_factory,
    do: %Product{
      uuid: Faker.UUID.v4(),
      name: Faker.Superhero.name(),
      description: Faker.Superhero.power(),
      image_url: Faker.Internet.image_url()
    }
end
