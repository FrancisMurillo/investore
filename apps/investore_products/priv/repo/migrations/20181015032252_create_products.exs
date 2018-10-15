defmodule InvestoreProducts.Repo.Migrations.CreateProducts do
  @moduledoc nil

  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add(:uuid, :uuid, primary_key: true)
      add(:name, :citext, null: false)
      add(:image_url, :string, null: true)
      add(:description, :string, null: true, size: 250)
      timestamps()
    end

    create(unique_index(:products, [:name]))
  end
end
