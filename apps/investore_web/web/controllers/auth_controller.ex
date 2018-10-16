defmodule InvestoreWeb.AuthController do
  @moduledoc false

  use InvestoreWeb.Web, :controller

  plug Ueberauth

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_status(401)
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    auth |> IO.inspect(label: "atuh")

    conn
    |> put_status(200)
  end

end
