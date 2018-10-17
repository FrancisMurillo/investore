defmodule InvestoreAccounts.User do
  @moduledoc nil

  use Ecto.Schema

  import Ecto.Changeset
  alias Ecto.Changeset

  alias __MODULE__, as: Entity

  alias RoleEnum

  @primary_key {:uuid, :binary_id, autogenerate: true}
  schema "users" do
    field(:username, :string, null: true)
    field(:email, :string)
    field(:image_url, :string, null: true)
    field(:role, RoleEnum)
    timestamps(type: :utc_datetime)
  end

  def changeset(entity = %Entity{}, params \\ %{}),
    do:
      entity
      |> cast(params, [:uuid, :username, :email, :image_url, :role])
      |> validate_required([:email, :role])
      |> validate_username()
      |> validate_email()

  def signin_guest_changeset(entity = %Entity{}, params \\ %{}),
    do:
      entity
      |> cast(params, [:email, :image_url])
      |> validate_required([:email])
      |> validate_email()
      |> put_change(:role, :guest)

  defp validate_username(changeset),
    do:
      changeset
      |> validate_format(:username, ~r/^[A-Z0-9_]+/i)
      |> unique_constraint(:username)

  defp validate_email(changeset),
    do:
      changeset
      |> validate_format(:email, ~r/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i)
      |> unique_constraint(:email)
end
