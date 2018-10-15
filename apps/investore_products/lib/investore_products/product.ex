defmodule InvestoreProducts.Product do
  @moduledoc nil

  use Ecto.Schema

  import Ecto.Changeset
  alias Ecto.Changeset

  alias __MODULE__, as: Entity

  @primary_key {:uuid, :binary_id, autogenerate: true}
  schema "products" do
    field(:name, :string)
    field(:image_url, :string)
    field(:description, :string)
    timestamps(type: :utc_datetime)
  end

  def changeset(entity = %Entity{}, params \\ %{}),
    do:
      entity
      |> cast(params, [:uuid, :name, :image_url, :description])
      |> validate_required([:name])
      |> validate_name()
      |> validate_description()

  defp validate_name(changeset),
    do:
      changeset
      |> validate_length(:name, min: 1, max: 150)
      |> unique_constraint(:name)

  defp validate_description(changeset),
    do:
      changeset
      |> validate_length(:description, max: 250)

  defdelegate add_changeset(entity, params), to: Entity, as: :changeset
end
