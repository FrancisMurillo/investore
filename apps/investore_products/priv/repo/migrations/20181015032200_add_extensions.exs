defmodule InvestoreProducts.Repo.Migrations.AddExtensions do
  @moduledoc nil

  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS citext", "CREATE EXTENSION IF NOT EXISTS citext")

    execute("CREATE EXTENSION IF NOT EXISTS pg_trgm", "CREATE EXTENSION IF NOT EXISTS pg_trgm")
    execute("SELECT set_limit(0.1)", "SELECT set_limit(0.3)")

    execute(
      "CREATE EXTENSION IF NOT EXISTS btree_gin",
      "CREATE EXTENSION IF NOT EXISTS btree_gin"
    )
  end
end
