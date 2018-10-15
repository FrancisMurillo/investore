defmodule InvestoreProducts.Repo.Migrations.CreateProducts do
  @moduledoc nil

  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add(:uuid, :uuid, primary_key: true)
      add(:name, :citext, null: false, size: 150)
      add(:image_url, :text, null: true)
      add(:description, null: true, size: 250)
      timestamps()
    end
  end
end
