defmodule InvestoreProducts.Product do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "products" do
    field(:name, :string)
    field(:image_url, :string)
    field(:description, :string)
    timestamps(type: :utc_datetime)
  end
end
