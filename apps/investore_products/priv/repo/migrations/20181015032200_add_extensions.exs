defmodule InvestoreProducts.Repo.Migrations.AddExtensions do
  @moduledoc nil

  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS citext", "DROP EXTENSION IF EXISTS citext")

    execute("CREATE EXTENSION IF NOT EXISTS pg_trgm", "DROP EXTENSION IF EXISTS pg_trgm")
    execute("SELECT set_limit(0.1)", "SELECT set_limit(0.3)")
  end
end
