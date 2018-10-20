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
    execute "CREATE INDEX IF NOT EXISTS products_search_trgm_index ON products USING gin (name gin_trgm_ops, description gin_trgm_ops)", "DROP INDEX IF EXISTS products_name_trgm_index;"
  end
end
