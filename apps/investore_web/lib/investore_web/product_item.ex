defmodule InvestoreWeb.ProductItem do
  @moduledoc nil

  use Ecto.Schema

  import Ecto.Changeset
  alias Ecto.Changeset

  alias __MODULE__, as: Entity

  @primary_key {:uuid, :binary_id, autogenerate: true}
  schema "product_items" do
    field(:name, :string)
    field(:image_url, :string)
    field(:description, :string)
    timestamps(type: :utc_datetime)
  end

  def changeset(entity = %Entity{}, params \\ %{}),
    do:
      entity
      |> cast(params, [:uuid, :name, :image_url, :description])
      |> validate_required([:uuid, :name])
end
