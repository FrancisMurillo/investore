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
    field(:password, :string, virtual: true)
    field(:password_hash, :string, null: true)
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

  def signin_changeset(params) do
    {%{}, %{credentia: :string, password: :string}}
    |> cast(params, [:username, :password])
    |> validate_login()
    |> validate_password()
  end

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

  defp validate_login(changeset),
    do:
      changeset
      |> validate_format(:credential, ~r/^[A-Z0-9_@.]+/i)

  defp validate_password(changeset),
    do:
      changeset
      |> validate_length(:password, min: 8, max: 50)
end
