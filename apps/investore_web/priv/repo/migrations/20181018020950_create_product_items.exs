defmodule InvestoreWeb.Repo.Migrations.CreateProductItems do
  @moduledoc nil

  use Ecto.Migration

  def change do
    create table(:product_items, primary_key: false) do
      add(:uuid, :uuid, primary_key: true)
      add(:name, :citext, null: false)
      add(:image_url, :string, null: true)
      add(:description, :string, null: true, size: 250)
      timestamps()
    end
  end
end
