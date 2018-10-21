defmodule InvestoreAccounts.Repo.Migrations.AddExtensions do
  @moduledoc nil

  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS citext", "CREATE EXTENSION IF NOT EXISTS citext")
  end
end
