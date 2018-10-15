defmodule InvestoreProducts.Repo.Migrations.AddExtensions do
  @moduledoc nil

  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS citext", "DROP EXTENSION IF EXISTS citext")
  end
end
