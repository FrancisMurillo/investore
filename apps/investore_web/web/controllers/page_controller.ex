defmodule InvestoreWeb.PageController do
  @moduledoc false

  use InvestoreWeb.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
