defmodule InvestoreAccounts.Repo.Migrations.CreateUsers do
  @moduledoc nil

  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:uuid, :uuid, primary_key: true)
      add(:username, :citext, null: true)
      add(:password_hash, :string, null: true, size: 250)
      add(:email, :citext)
      add(:image_url, :string, null: true)
      add(:role, :integer)
      timestamps()
    end

    create(unique_index(:users, [:username], where: "username IS NOT NULL"))
    create(unique_index(:users, [:email]))
  end
end
