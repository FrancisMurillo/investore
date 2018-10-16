defmodule InvestoreWeb.LayoutView do
  use InvestoreWeb.Web, :view

  def webpack_js_path(conn, path) do
    if Mix.env() == :prod do
      static_path(conn, path)
    else
      "//localhost:41080#{path}"
    end
  end

  def webpack_css_path(conn, path) do
    if Mix.env() == :prod do
      static_path(conn, path)
    else
      "//localhost:41080#{path}"
    end
  end

end
